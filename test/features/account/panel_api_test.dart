import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fl_clash/features/account/panel_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizePanelUrl', () {
    test('accepts HTTPS and trims trailing slashes', () {
      expect(
        normalizePanelUrl(' https://panel.example.com/// '),
        'https://panel.example.com',
      );
    });

    test('allows HTTP only for a loopback development panel', () {
      expect(normalizePanelUrl('http://127.0.0.1:7001'), contains('7001'));
      expect(
        () => normalizePanelUrl('http://panel.example.com'),
        throwsA(isA<PanelApiException>()),
      );
    });

    test('rejects credentials and non-root panel URLs', () {
      for (final url in [
        'https://user:secret@panel.example.com',
        'https://panel.example.com/client',
        'https://panel.example.com?token=secret',
        'https://panel.example.com/#fragment',
      ]) {
        expect(() => normalizePanelUrl(url), throwsA(isA<PanelApiException>()));
      }
    });
  });

  test('subscription URL must use the panel origin', () {
    expect(
      validateSubscriptionUrl(
        'https://panel.example.com/s/token',
        'https://panel.example.com',
      ),
      'https://panel.example.com/s/token',
    );
    expect(
      () => validateSubscriptionUrl(
        'https://other.example.com/s/token',
        'https://panel.example.com',
      ),
      throwsA(isA<PanelApiException>()),
    );
  });

  test('login and account use the expected client contract', () async {
    final adapter = _QueueAdapter([
      _jsonResponse({
        'status': 'success',
        'data': {'auth_data': 'Bearer secret-token'},
      }),
      _jsonResponse({
        'status': 'success',
        'data': {
          'email': 'client@example.com',
          'subscription': {
            'url': 'https://panel.example.com/s/subscription',
            'plan_id': 1,
            'plan_name': 'Monthly',
            'expires_at': 1893456000,
            'upload': 100,
            'download': 200,
            'total': 1024,
          },
        },
      }),
    ]);
    final dio = Dio(BaseOptions(baseUrl: 'https://panel.example.com'))
      ..httpClientAdapter = adapter;
    final api = PanelApi('https://panel.example.com', dio: dio);

    final authorization = await api.login(
      email: 'client@example.com',
      password: 'password',
    );
    final account = await api.getAccount(authorization);

    expect(authorization, 'Bearer secret-token');
    expect(account.email, 'client@example.com');
    expect(account.used, 300);
    expect(account.planName, 'Monthly');
    expect(
      adapter.requests.last.headers['Authorization'],
      'Bearer secret-token',
    );
  });

  test('maps an unauthorized response without exposing request data', () async {
    final adapter = _QueueAdapter([
      _jsonResponse({
        'status': 'fail',
        'message': 'Session expired',
        'data': null,
      }, statusCode: 403),
    ]);
    final dio = Dio(BaseOptions(baseUrl: 'https://panel.example.com'))
      ..httpClientAdapter = adapter;
    final api = PanelApi('https://panel.example.com', dio: dio);

    await expectLater(
      api.getAccount('Bearer expired'),
      throwsA(
        isA<PanelApiException>()
            .having((error) => error.isUnauthorized, 'unauthorized', isTrue)
            .having((error) => error.toString(), 'message', 'Session expired'),
      ),
    );
  });
}

ResponseBody _jsonResponse(Map<String, Object?> body, {int statusCode = 200}) {
  return ResponseBody.fromString(
    json.encode(body),
    statusCode,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

class _QueueAdapter implements HttpClientAdapter {
  final List<ResponseBody> responses;
  final List<RequestOptions> requests = [];

  _QueueAdapter(this.responses);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return responses.removeAt(0);
  }

  @override
  void close({bool force = false}) {}
}
