import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/services/xboard_api_client.dart';

class XboardAuthService {
  static const String _keyXboardAuthData = 'xboard_auth_data';
  static const String _keyXboardUser = 'xboard_user';
  static const String _keyXboardLoginTime = 'xboard_login_time';

  static XboardAuthService? _instance;
  factory XboardAuthService() => _instance ??= XboardAuthService._internal();
  XboardAuthService._internal();

  late final XboardApiClient _apiClient;
  XboardUser? _currentUser;
  String? _authData;
  DateTime? _loginTime;

  // 初始化服务
  Future<void> initialize() async {
    _apiClient = XboardApiClient();
    await _loadStoredCredentials();
  }

  // 从本地存储加载凭据
  Future<void> _loadStoredCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    _authData = prefs.getString(_keyXboardAuthData);
    final userJson = prefs.getString(_keyXboardUser);
    final loginTimeStamp = prefs.getInt(_keyXboardLoginTime);

    if (_authData != null) {
      _apiClient.setAuthData(_authData);
    }

    if (userJson != null) {
      try {
        _currentUser = XboardUser.fromJson(jsonDecode(userJson));
      } catch (e) {
        // 如果解析失败，清除存储的用户信息
        await _clearStoredUser();
      }
    }

    if (loginTimeStamp != null) {
      _loginTime = DateTime.fromMillisecondsSinceEpoch(loginTimeStamp);
    }
  }

  // 用户登录
  Future<XboardLoginResponse> login(String email, String password) async {
    try {
      final response = await _apiClient.login(email, password);

      if (response.status == 'success' && response.data?.authData != null) {
        _authData = response.data!.authData;
        _loginTime = DateTime.now();

        // 获取用户信息
        await _fetchUserInfo();
        await _saveCredentials();
      }

      return response;
    } catch (e) {
      return XboardLoginResponse(
        status: 'error',
        message: e.toString(),
      );
    }
  }

  // 获取用户信息
  Future<void> _fetchUserInfo() async {
    try {
      final response = await _apiClient.getUserInfo();
      if (response.status == 'success' && response.data != null) {
        _currentUser = response.data;
      }
    } catch (e) {
      // 获取用户信息失败不影响登录
    }
  }

  // 保存凭据到本地存储
  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    if (_authData != null) {
      await prefs.setString(_keyXboardAuthData, _authData!);
    }

    if (_currentUser != null) {
      await prefs.setString(_keyXboardUser, jsonEncode(_currentUser!.toJson()));
    }

    if (_loginTime != null) {
      await prefs.setInt(
          _keyXboardLoginTime, _loginTime!.millisecondsSinceEpoch);
    }
  }

  // 清除存储的用户信息
  Future<void> _clearStoredUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyXboardAuthData);
    await prefs.remove(_keyXboardUser);
    await prefs.remove(_keyXboardLoginTime);
  }

  // 用户登出
  Future<void> logout() async {
    _authData = null;
    _currentUser = null;
    _loginTime = null;

    await _apiClient.logout();
    await _clearStoredUser();
  }

  // 刷新用户信息
  Future<bool> refreshUserInfo() async {
    if (!isLoggedIn) return false;

    try {
      final response = await _apiClient.getUserInfo();

      if (response.status == 'success' && response.data != null) {
        _currentUser = response.data;
        await _saveCredentials();
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  // 检查登录状态
  bool get isLoggedIn {
    return _authData != null && _currentUser != null;
  }

  // 检查登录是否过期（7天）
  bool get isLoginExpired {
    if (_loginTime == null) return true;

    final now = DateTime.now();
    final difference = now.difference(_loginTime!);
    return difference.inDays > 7;
  }

  // 获取当前用户
  XboardUser? get currentUser => _currentUser;

  // 获取当前认证数据
  String? get currentAuthData => _authData;

  // 获取API客户端
  XboardApiClient get apiClient => _apiClient;

  // 自动登录检查
  Future<bool> checkAutoLogin() async {
    if (!isLoggedIn || isLoginExpired) {
      await logout();
      return false;
    }

    // 尝试刷新用户信息来验证token是否有效
    return await refreshUserInfo();
  }

  // 获取用户流量信息 - 需要从订阅信息中获取准确的已用流量
  String get userTrafficInfo {
    if (_currentUser == null) return '未登录';

    // 从用户信息中获取总流量限制
    final total = _currentUser!.transferEnable;

    if (total == 0) return '无限制';

    // 注意：用户信息中没有已用流量数据，需要从订阅信息中获取
    // 这里先显示总流量，已用流量需要从订阅信息中获取
    final totalGB = (total / (1024 * 1024 * 1024)).toStringAsFixed(2);

    return '总流量: $totalGB GB';
  }

  // 获取用户过期时间信息
  String get userExpireInfo {
    if (_currentUser == null) return '未登录';

    if (_currentUser!.expiredAt == 0) return '永久有效';

    final expireDate =
        DateTime.fromMillisecondsSinceEpoch(_currentUser!.expiredAt * 1000);
    final now = DateTime.now();

    if (expireDate.isBefore(now)) {
      return '已过期';
    }

    final difference = expireDate.difference(now);
    if (difference.inDays > 0) {
      return '${difference.inDays}天后过期';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时后过期';
    } else {
      return '${difference.inMinutes}分钟后过期';
    }
  }

  // 检查用户是否被禁用
  bool get isUserBanned => _currentUser?.banned ?? false;

  // 获取用户余额信息
  String get userBalanceInfo {
    if (_currentUser == null) return '未登录';

    final balance = _currentUser!.balance / 100; // 假设余额以分为单位存储
    return '¥${balance.toStringAsFixed(2)}';
  }
}
