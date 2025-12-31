import 'package:dio/dio.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';

/// Xboard API 响应结构
class XboardResponse<T> {
  final String status;
  final String? message;
  final T? data;
  final String? error;

  XboardResponse({
    required this.status,
    this.message,
    this.data,
    this.error,
  });

  bool get isSuccess => status == 'success';
}

/// Xboard API 服务
class XboardApi {
  late final Dio _dio;
  String _baseUrl;
  String? _authData;

  XboardApi({String? baseUrl}) : _baseUrl = baseUrl ?? '' {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Language': 'zh-CN',
          'Accept': 'application/json, text/plain, */*',
        },
      ),
    );
  }

  /// 设置面板地址
  void setBaseUrl(String url) {
    _baseUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }

  /// 获取当前面板地址
  String get baseUrl => _baseUrl;

  /// 设置认证令牌
  void setAuth(String? authData) {
    _authData = authData;
    if (authData != null) {
      _dio.options.headers['Authorization'] = authData;
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  /// 是否已认证
  bool get isAuthenticated => _authData != null && _authData!.isNotEmpty;

  /// 登录
  Future<Result<XboardAuth>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/api/v1/passport/auth/login',
        data: 'email=${Uri.encodeComponent(email)}&password=${Uri.encodeComponent(password)}',
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success' && json['data'] != null) {
          final auth = XboardAuth.fromJson(json['data']);
          setAuth(auth.authData);
          return Result.success(auth);
        }
        return Result.error(json['message'] ?? '登录失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 注册
  Future<Result<XboardAuth>> register({
    required String email,
    required String password,
    String? inviteCode,
    String? emailCode,
  }) async {
    try {
      final params = <String, String>{
        'email': email,
        'password': password,
      };
      if (inviteCode != null && inviteCode.isNotEmpty) {
        params['invite_code'] = inviteCode;
      }
      if (emailCode != null && emailCode.isNotEmpty) {
        params['email_code'] = emailCode;
      }

      final response = await _dio.post(
        '$_baseUrl/api/v1/passport/auth/register',
        data: params.entries
            .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
            .join('&'),
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success' && json['data'] != null) {
          final auth = XboardAuth.fromJson(json['data']);
          setAuth(auth.authData);
          return Result.success(auth);
        }
        return Result.error(json['message'] ?? '注册失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 发送邮箱验证码
  Future<Result<bool>> sendEmailCode(String email) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/api/v1/passport/comm/sendEmailVerify',
        data: 'email=${Uri.encodeComponent(email)}',
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success') {
          return Result.success(true);
        }
        return Result.error(json['message'] ?? '发送失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 获取用户信息
  Future<Result<XboardUser>> getUserInfo() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final response = await _dio.get('$_baseUrl/api/v1/user/info?t=$timestamp');

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success' && json['data'] != null) {
          return Result.success(XboardUser.fromJson(json['data']));
        }
        return Result.error(json['message'] ?? '获取用户信息失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 获取订阅信息
  Future<Result<XboardSubscribe>> getSubscribe() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final response =
          await _dio.get('$_baseUrl/api/v1/user/getSubscribe?t=$timestamp');

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success' && json['data'] != null) {
          return Result.success(XboardSubscribe.fromJson(json['data']));
        }
        return Result.error(json['message'] ?? '获取订阅信息失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 获取公告列表
  Future<Result<List<XboardNotice>>> getNotices() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final response =
          await _dio.get('$_baseUrl/api/v1/user/notice/fetch?t=$timestamp');

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final dataList = json['data'] as List?;
        if (dataList != null) {
          final notices =
              dataList.map((e) => XboardNotice.fromJson(e)).toList();
          return Result.success(notices);
        }
        return Result.success([]);
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 重置订阅链接
  Future<Result<String>> resetSubscribeToken() async {
    try {
      final response = await _dio.get('$_baseUrl/api/v1/user/resetSecurity');

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        if (json['status'] == 'success') {
          return Result.success(json['data'] ?? '');
        }
        return Result.error(json['message'] ?? '重置失败');
      }
      return Result.error('请求失败: ${response.statusCode}');
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  /// 登出
  void logout() {
    setAuth(null);
  }

  /// 处理 Dio 错误
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return '连接超时，请检查网络';
      case DioExceptionType.sendTimeout:
        return '发送超时，请检查网络';
      case DioExceptionType.receiveTimeout:
        return '接收超时，请检查网络';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return '认证已过期，请重新登录';
        } else if (statusCode == 403) {
          return '访问被拒绝';
        } else if (statusCode == 404) {
          return '接口不存在，请检查面板地址';
        } else if (statusCode == 500) {
          return '服务器错误';
        }
        return '请求失败: $statusCode';
      case DioExceptionType.cancel:
        return '请求已取消';
      case DioExceptionType.connectionError:
        return '连接失败，请检查面板地址';
      default:
        return e.message ?? '网络错误';
    }
  }
}

/// 全局 Xboard API 实例
final xboardApi = XboardApi();

