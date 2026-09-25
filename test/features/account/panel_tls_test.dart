import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fl_clash/features/account/panel_api.dart';
import 'package:flutter_test/flutter_test.dart';

/// Runs the account flow against a real TLS listener using a local CA supplied
/// through `FLY001_TEST_TLS_CA`, `FLY001_TEST_TLS_CERT` and
/// `FLY001_TEST_TLS_KEY`; see `local-ca/README.md`. Keys are never committed, so
/// the test skips when they are absent.
void main() {
  final ca = Platform.environment['FLY001_TEST_TLS_CA'];
  final cert = Platform.environment['FLY001_TEST_TLS_CERT'];
  final key = Platform.environment['FLY001_TEST_TLS_KEY'];
  final missing = [
    if (ca == null) 'FLY001_TEST_TLS_CA',
    if (cert == null) 'FLY001_TEST_TLS_CERT',
    if (key == null) 'FLY001_TEST_TLS_KEY',
  ];

  test('the panel client completes the account flow over TLS', () async {
    final serverContext = SecurityContext()
      ..useCertificateChain(cert!)
      ..usePrivateKey(key!);
    final server = await HttpServer.bindSecure(
      InternetAddress.loopbackIPv4,
      0,
      serverContext,
    );
    addTearDown(server.close);

    var revoked = false;
    server.listen((request) async {
      final path = request.uri.path;
      if (path == '/api/v1/passport/auth/login') {
        await request.drain<void>();
        return _json(request, {
          'status': 'success',
          'data': {'auth_data': 'Bearer tls-token'},
        });
      }
      if (request.headers.value('authorization') != 'Bearer tls-token' ||
          revoked) {
        return _json(request, {
          'status': 'fail',
          'message': 'unauthenticated',
        }, status: 403);
      }
      switch (path) {
        case '/api/v2/client/account':
          return _json(request, {
            'status': 'success',
            'data': {
              'account_id': 'account-tls',
              'email': 'client@example.com',
              'subscription': {
                'available': true,
                'plan_id': 1,
                'plan_name': 'Monthly',
                'expires_at': 1893456000,
                'upload': 1,
                'download': 2,
                'total': 1024,
              },
            },
          });
        case '/api/v2/client/subscription':
          request.response.headers.set('subscription-userinfo', 'total=1024');
          request.response.headers.contentType = ContentType.parse('text/yaml');
          request.response.add(utf8.encode('proxies: []\n'));
          return request.response.close();
        case '/api/v2/client/session/logout':
          await request.drain<void>();
          revoked = true;
          return _json(request, {'status': 'success', 'data': true});
      }
      return _json(request, {'status': 'fail'}, status: 404);
    });

    final clientContext = SecurityContext(withTrustedRoots: false)
      ..setTrustedCertificates(ca!);
    final dio = Dio(BaseOptions(baseUrl: 'https://localhost:${server.port}'))
      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () => HttpClient(context: clientContext),
      );
    final api = PanelApi('https://localhost:${server.port}', dio: dio);

    final authorization = await api.login(
      email: 'client@example.com',
      password: 'password',
    );
    final account = await api.getAccount(authorization);
    final subscription = await api.getSubscription(authorization);

    expect(authorization, 'Bearer tls-token');
    expect(account.accountId, 'account-tls');
    expect(account.canSync, isTrue);
    expect(utf8.decode(subscription.bytes), 'proxies: []\n');
    expect(subscription.userinfo, 'total=1024');

    await api.logout(authorization);
    await expectLater(
      api.getAccount(authorization),
      throwsA(
        isA<PanelApiException>().having(
          (error) => error.isUnauthorized,
          'unauthorized',
          isTrue,
        ),
      ),
    );
  }, skip: missing.isEmpty ? false : 'missing ${missing.join(', ')}');
}

Future<void> _json(
  HttpRequest request,
  Map<String, Object?> body, {
  int status = 200,
}) async {
  request.response.statusCode = status;
  request.response.headers.contentType = ContentType.json;
  request.response.write(json.encode(body));
  await request.response.close();
}
