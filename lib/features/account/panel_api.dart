import 'package:dio/dio.dart';

import 'panel_models.dart';

class PanelApiException implements Exception {
  final String message;
  final int? statusCode;

  const PanelApiException(this.message, {this.statusCode});

  bool get isUnauthorized => statusCode == 401 || statusCode == 403;

  @override
  String toString() => message;
}

class PanelApi {
  final Dio _dio;

  PanelApi(String baseUrl, {Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: normalizePanelUrl(baseUrl),
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 30),
              followRedirects: false,
              headers: const {'Accept': 'application/json'},
            ),
          );

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final data = await _request(
      'POST',
      '/api/v1/passport/auth/login',
      data: {'email': email, 'password': password},
    );
    final authorization = data['auth_data']?.toString() ?? '';
    if (!authorization.startsWith('Bearer ')) {
      throw const PanelApiException('Invalid login response');
    }
    return authorization;
  }

  Future<PanelAccount> getAccount(String authorization) async {
    final data = await _request(
      'GET',
      '/api/v2/client/account',
      authorization: authorization,
    );
    return PanelAccount.fromJson(data);
  }

  Future<void> logout(String authorization) async {
    await _request(
      'POST',
      '/api/v2/client/session/logout',
      authorization: authorization,
    );
  }

  Future<Map<String, Object?>> _request(
    String method,
    String path, {
    Object? data,
    String? authorization,
  }) async {
    try {
      final response = await _dio.request<Object?>(
        path,
        data: data,
        options: Options(
          method: method,
          headers: authorization == null
              ? null
              : {'Authorization': authorization},
        ),
      );
      final envelope = _asMap(response.data);
      if (envelope['status'] != 'success') {
        throw PanelApiException(
          envelope['message']?.toString() ?? 'Panel request failed',
          statusCode: response.statusCode,
        );
      }
      final responseData = envelope['data'];
      if (responseData is bool) return const {};
      return _asMap(responseData);
    } on PanelApiException {
      rethrow;
    } on DioException catch (error) {
      final envelope = _asMap(error.response?.data);
      throw PanelApiException(
        envelope['message']?.toString() ?? error.message ?? 'Network error',
        statusCode: error.response?.statusCode,
      );
    }
  }
}

String normalizePanelUrl(String value) {
  final normalized = value.trim().replaceFirst(RegExp(r'/+$'), '');
  final uri = Uri.tryParse(normalized);
  if (uri == null ||
      !uri.hasScheme ||
      uri.host.isEmpty ||
      uri.userInfo.isNotEmpty ||
      uri.hasQuery ||
      uri.hasFragment ||
      (uri.path.isNotEmpty && uri.path != '/')) {
    throw const PanelApiException('Invalid panel URL');
  }
  final isLocal = _isLoopback(uri.host);
  if (uri.scheme != 'https' && !(uri.scheme == 'http' && isLocal)) {
    throw const PanelApiException('The panel must use HTTPS');
  }
  return normalized;
}

String validateSubscriptionUrl(String value, String panelBaseUrl) {
  final subscription = Uri.tryParse(value);
  final panel = Uri.parse(normalizePanelUrl(panelBaseUrl));
  if (subscription == null ||
      subscription.userInfo.isNotEmpty ||
      subscription.hasFragment ||
      subscription.scheme != panel.scheme ||
      subscription.host != panel.host ||
      subscription.port != panel.port) {
    throw const PanelApiException('Invalid subscription URL');
  }
  return value;
}

bool _isLoopback(String host) {
  return host == 'localhost' || host == '127.0.0.1' || host == '::1';
}

Map<String, Object?> _asMap(Object? value) {
  if (value is! Map) return const {};
  return value.map((key, value) => MapEntry(key.toString(), value));
}
