import 'package:dio/dio.dart';
import 'package:fl_clash/models/models.dart';

class XboardApiClient {
  late final Dio _dio;
  String? _authData;
  static const String _baseUrl = 'http://103.86.47.200:7001';

  XboardApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Language': 'zh-CN',
        'Accept-Language': 'zh-CN,zh-Hans;q=0.9',
        'User-Agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15',
      },
    ));

    // 添加请求拦截器，自动添加token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authData != null) {
            options.headers['Authorization'] = _authData;
          }
          handler.next(options);
        },
      ),
    );
  }

  // 设置认证数据
  void setAuthData(String? authData) {
    _authData = authData;
  }

  // 用户登录
  Future<XboardLoginResponse> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/v1/passport/auth/login',
        data:
            'email=${Uri.encodeComponent(email)}&password=${Uri.encodeComponent(password)}',
      );

      final loginResponse = XboardLoginResponse.fromJson(response.data);

      if (loginResponse.status == 'success' &&
          loginResponse.data?.authData != null) {
        setAuthData(loginResponse.data!.authData);
      }

      return loginResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic>) {
          return XboardLoginResponse(
            status: 'error',
            message: errorData['message'] ?? '登录失败',
          );
        }
      }
      return XboardLoginResponse(
        status: 'error',
        message: e.message ?? '网络连接失败',
      );
    }
  }

  // 获取用户信息
  Future<XboardUserResponse> getUserInfo() async {
    if (_authData == null) {
      throw Exception('请先登录');
    }

    try {
      final response = await _dio
          .get('/api/v1/user/info?t=${DateTime.now().millisecondsSinceEpoch}');

      return XboardUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic>) {
          return XboardUserResponse(
            status: 'error',
            message: errorData['message'] ?? '获取用户信息失败',
          );
        }
      }
      return XboardUserResponse(
        status: 'error',
        message: e.message ?? '网络连接失败',
      );
    }
  }

  // 获取订阅信息
  Future<XboardSubscriptionUrlResponse> getSubscriptionInfo() async {
    if (_authData == null) {
      throw Exception('请先登录');
    }

    try {
      final response = await _dio.get(
          '/api/v1/user/getSubscribe?t=${DateTime.now().millisecondsSinceEpoch}');

      return XboardSubscriptionUrlResponse.fromJson(response.data);
    } on DioException catch (e) {
      return XboardSubscriptionUrlResponse(
        status: 'error',
        message: e.message ?? '获取订阅信息失败',
      );
    }
  }

  // 登出
  Future<void> logout() async {
    _authData = null;
  }

  // 检查登录状态
  bool get isLoggedIn => _authData != null;

  // 获取当前认证数据
  String? get currentAuthData => _authData;
}
