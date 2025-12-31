import 'package:dio/dio.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:yaml/yaml.dart';

/// Xboard API 响应结构
class XboardResponse<T> {
  final String status;
  final String? message;
  final T? data;
  final String? error;

  XboardResponse({required this.status, this.message, this.data, this.error});

  bool get isSuccess => status == 'success';
}

/// 高可用服务 - 用于从多个域名获取真正的面板地址
class XboardHAService {
  final Dio _dio;

  /// 最近一次成功解析的配置
  XboardHAConfig? _lastConfig;

  /// 缓存的 UI 配置（从持久化存储恢复）
  XboardUIConfig? _cachedUiConfig;

  /// 缓存的配置版本号
  int? _cachedVersion;

  XboardHAService()
    : _dio = Dio(
        BaseOptions(
          connectTimeout: XboardConstants.haTimeout,
          receiveTimeout: XboardConstants.haTimeout,
        ),
      );

  /// 获取最近一次成功解析的配置
  XboardHAConfig? get lastConfig => _lastConfig;

  /// 获取当前 UI 配置（优先使用最新解析的，否则使用缓存的）
  XboardUIConfig get currentUiConfig =>
      _lastConfig?.ui ?? _cachedUiConfig ?? const XboardUIConfig();

  /// 获取当前配置版本号
  int get currentVersion => _lastConfig?.version ?? _cachedVersion ?? 0;

  /// 设置缓存的 UI 配置（从持久化存储恢复）
  void setCachedConfig(XboardUIConfig? uiConfig, int? version) {
    _cachedUiConfig = uiConfig;
    _cachedVersion = version;
  }

  /// 检查是否有新版本
  bool hasNewVersion(int? cachedVersion) {
    if (_lastConfig == null) return false;
    if (cachedVersion == null) return true;
    return _lastConfig!.version > cachedVersion;
  }

  /// 从高可用配置文件获取真正的面板地址
  /// 会依次尝试每个配置 URL，返回第一个成功获取到的地址
  Future<Result<String>> resolveBaseUrl() async {
    // 依次尝试每个配置 URL
    for (final configUrl in XboardConstants.haConfigUrls) {
      try {
        final config = await _fetchAndParseConfig(configUrl);
        if (config != null) {
          _lastConfig = config;

          // 验证主面板地址是否可用
          if (await _checkUrlAvailable(config.panelUrl)) {
            return Result.success(config.panelUrl);
          }

          // 主地址不可用，尝试备用地址
          for (final backupUrl in config.backupUrls) {
            if (await _checkUrlAvailable(backupUrl)) {
              return Result.success(backupUrl);
            }
          }
        }
      } catch (_) {
        // 继续尝试下一个配置 URL
        continue;
      }
    }

    // 所有配置都失败，返回默认地址
    return Result.success(XboardConstants.defaultBaseUrl);
  }

  /// 获取并解析配置文件
  Future<XboardHAConfig?> _fetchAndParseConfig(String configUrl) async {
    try {
      final response = await _dio.get(
        configUrl,
        options: Options(
          // 禁用缓存
          headers: {'Cache-Control': 'no-cache', 'Pragma': 'no-cache'},
        ),
      );
      if (response.statusCode == 200) {
        final yamlContent = response.data?.toString();
        if (yamlContent != null && yamlContent.isNotEmpty) {
          return _parseYamlConfig(yamlContent);
        }
      }
    } catch (_) {
      // 解析失败
    }
    return null;
  }

  /// 解析 YAML 配置
  XboardHAConfig? _parseYamlConfig(String yamlContent) {
    try {
      final yamlMap = loadYaml(yamlContent);
      if (yamlMap is YamlMap) {
        final map = _convertYamlMap(yamlMap);
        return XboardHAConfig.fromYaml(map);
      }
    } catch (_) {
      // YAML 解析失败
    }
    return null;
  }

  /// 将 YamlMap 转换为普通 Map
  Map<String, dynamic> _convertYamlMap(YamlMap yamlMap) {
    final result = <String, dynamic>{};
    for (final entry in yamlMap.entries) {
      final key = entry.key.toString();
      final value = entry.value;
      if (value is YamlMap) {
        result[key] = _convertYamlMap(value);
      } else if (value is YamlList) {
        result[key] = value
            .map((e) => e is YamlMap ? _convertYamlMap(e) : e)
            .toList();
      } else {
        result[key] = value;
      }
    }
    return result;
  }

  /// 检查 URL 是否可用（简单的连通性检查）
  Future<bool> _checkUrlAvailable(String url) async {
    if (!_isValidUrl(url)) return false;

    try {
      // 尝试访问面板的健康检查接口或首页
      final response = await _dio.head(
        url,
        options: Options(
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      return response.statusCode != null && response.statusCode! < 400;
    } catch (_) {
      // 如果 HEAD 请求失败，尝试 GET 请求
      try {
        final response = await _dio.get(
          url,
          options: Options(
            followRedirects: true,
            validateStatus: (status) => status != null && status < 500,
          ),
        );
        return response.statusCode != null && response.statusCode! < 400;
      } catch (_) {
        return false;
      }
    }
  }

  /// 验证 URL 格式
  bool _isValidUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }
}

/// Xboard API 服务
class XboardApi {
  late final Dio _dio;
  String _baseUrl;
  String? _authData;
  final XboardHAService _haService = XboardHAService();

  /// 高可用解析到的地址缓存
  String? _haResolvedUrl;

  /// 高可用解析时间
  int? _haResolvedTime;

  /// 缓存有效期（30分钟）
  static const int _haCacheDuration = 30 * 60 * 1000;

  XboardApi({String? baseUrl})
    : _baseUrl = baseUrl ?? XboardConstants.defaultBaseUrl {
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

  /// 获取高可用服务
  XboardHAService get haService => _haService;

  /// 获取当前 UI 配置（优先使用最新解析的，否则使用缓存的）
  XboardUIConfig get uiConfig => _haService.currentUiConfig;

  /// 获取当前配置版本号
  int get configVersion => _haService.currentVersion;

  /// 检查是否有新版本配置
  bool hasNewVersion(int? cachedVersion) =>
      _haService.hasNewVersion(cachedVersion);

  /// 设置缓存的配置（从持久化存储恢复）
  void setCachedUiConfig(XboardUIConfig? uiConfig, int? version) {
    _haService.setCachedConfig(uiConfig, version);
  }

  /// 通过高可用服务解析并设置面板地址
  /// [forceRefresh] 是否强制刷新（忽略缓存）
  Future<Result<String>> resolveAndSetBaseUrl({
    bool forceRefresh = false,
  }) async {
    // 检查缓存是否有效
    if (!forceRefresh && _haResolvedUrl != null && _haResolvedTime != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - _haResolvedTime! < _haCacheDuration) {
        setBaseUrl(_haResolvedUrl!);
        return Result.success(_haResolvedUrl!);
      }
    }

    // 从高可用服务解析
    final result = await _haService.resolveBaseUrl();
    if (result.isSuccess && result.data != null) {
      _haResolvedUrl = result.data;
      _haResolvedTime = DateTime.now().millisecondsSinceEpoch;
      setBaseUrl(result.data!);
      return Result.success(result.data!);
    }

    // 解析失败，使用默认地址
    setBaseUrl(XboardConstants.defaultBaseUrl);
    return Result.success(XboardConstants.defaultBaseUrl);
  }

  /// 设置高可用缓存（用于从持久化配置恢复）
  void setHACache(String? url, int? time) {
    _haResolvedUrl = url;
    _haResolvedTime = time;
  }

  /// 获取高可用解析到的地址
  String? get haResolvedUrl => _haResolvedUrl;

  /// 获取高可用解析时间
  int? get haResolvedTime => _haResolvedTime;

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
        data:
            'email=${Uri.encodeComponent(email)}&password=${Uri.encodeComponent(password)}',
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
      final params = <String, String>{'email': email, 'password': password};
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
      final response = await _dio.get(
        '$_baseUrl/api/v1/user/info?t=$timestamp',
      );

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
      final response = await _dio.get(
        '$_baseUrl/api/v1/user/getSubscribe?t=$timestamp',
      );

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
      final response = await _dio.get(
        '$_baseUrl/api/v1/user/notice/fetch?t=$timestamp',
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final dataList = json['data'] as List?;
        if (dataList != null) {
          final notices = dataList
              .map((e) => XboardNotice.fromJson(e))
              .toList();
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
