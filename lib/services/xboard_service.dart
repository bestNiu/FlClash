import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/xboard.dart';
import 'package:fl_clash/models/common.dart';

class XboardService {
  static const String _baseUrl = 'http://103.86.47.200:7001/api/v1';
  late final Dio _dio;
  String? _token;
  String? _authData;

  XboardService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        "User-Agent": browserUa,
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authData != null) {
            options.headers['Authorization'] = _authData;
          }
          handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            _token = null;
            _authData = null;
          }
          handler.next(error);
        },
      ),
    );
  }

  /// 登录
  Future<Result<XboardSession>> login({
    required String email,
    required String password,
  }) async {
    print(
        '[XboardService] 请求: /passport/auth/login, 参数: email=$email, password=***');
    try {
      final response = await _dio.post(
        '/passport/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      print('[XboardService] 响应: /passport/auth/login, data:');
      print(response.data);
      if (response.statusCode == 200 && response.data is Map) {
        final map = response.data as Map<String, dynamic>;
        if (map['status'] == 'success' && map['data'] is Map) {
          final innerData = map['data'] as Map<String, dynamic>;
          print('[XboardService] 解析结果: XboardSession:');
          print(innerData);
          _token = innerData['token'] as String?;
          _authData = innerData['auth_data'] as String?;
          return Result.success(XboardSession(
            token: _token!,
            authData: _authData!,
            isAdmin: innerData['is_admin'] ?? false,
          ));
        } else {
          return Result.error(map['message']?.toString() ?? '登录失败');
        }
      } else {
        return Result.error('Login failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Result.error('Invalid email or password');
      }
      return Result.error('Network error: ${e.message}');
    } catch (e) {
      return Result.error('Unexpected error: $e');
    }
  }

  /// 获取用户信息
  Future<Result<XboardUser>> getUserInfo() async {
    print('[XboardService] 请求: /user/info');
    if (_authData == null) return Result.error('Not logged in');
    try {
      final response = await _dio.get('/user/info');
      print('[XboardService] 响应: /user/info, data:');
      print(response.data);
      if (response.statusCode == 200 && response.data is Map) {
        final map = response.data as Map<String, dynamic>;
        if (map['status'] == 'success' && map['data'] is Map) {
          final data = map['data'] as Map<String, dynamic>;
          print('[XboardService] 解析结果: XboardUser:');
          print(data);
          return Result.success(XboardUser.fromJson(data));
        } else {
          return Result.error(map['message']?.toString() ?? '获取用户信息失败');
        }
      } else {
        return Result.error('Get user info failed: ${response.statusMessage}');
      }
    } catch (e) {
      return Result.error('Unexpected error: $e');
    }
  }

  /// 获取订阅信息
  Future<Result<XboardSubscribeInfo>> getSubscribeInfo() async {
    print('[XboardService] 请求: /user/getSubscribe');
    if (_authData == null) return Result.error('Not logged in');
    try {
      final response = await _dio.get('/user/getSubscribe');
      print('[XboardService] 响应: /user/getSubscribe, data:');
      print(response.data);
      if (response.statusCode == 200 && response.data is Map) {
        final map = response.data as Map<String, dynamic>;
        if (map['status'] == 'success' && map['data'] is Map) {
          final data = map['data'] as Map<String, dynamic>;
          print('[XboardService] 解析结果: XboardSubscribeInfo:');
          print(data);
          return Result.success(XboardSubscribeInfo.fromJson(data));
        } else {
          return Result.error(map['message']?.toString() ?? '获取订阅失败');
        }
      } else {
        return Result.error('Get subscribe failed: ${response.statusMessage}');
      }
    } catch (e) {
      return Result.error('Unexpected error: $e');
    }
  }

  /// 登出
  Future<void> logout() async {
    _token = null;
    _authData = null;
  }

  String? get token => _token;
  String? get authData => _authData;
}

final xboardService = XboardService();
