import 'dart:convert';
import 'dart:typed_data';

import 'package:fl_clash/features/account/panel_api.dart';
import 'package:fl_clash/features/account/panel_models.dart';
import 'package:fl_clash/features/account/panel_session_store.dart';
import 'package:fl_clash/providers/providers.dart';

const panelBaseUrl = 'https://panel.example';
const panelAccountId = 'account-1';

PanelAccount testPanelAccount({
  int? planId = 1,
  bool available = true,
  int expiresAt = 4102444800,
}) => PanelAccount(
  accountId: panelAccountId,
  email: 'client@example.com',
  subscriptionAvailable: available,
  expiresAt: expiresAt,
  upload: 1,
  download: 2,
  total: 1024,
  planId: planId,
  planName: planId == null ? null : 'Monthly',
);

class FakePanelSessionStore implements PanelSessionStore {
  PanelSession? session;
  int writes = 0;
  int clears = 0;

  @override
  Future<PanelSession?> read() async => session;

  @override
  Future<void> write(PanelSession value) async {
    session = value;
    writes++;
  }

  @override
  Future<void> clear() async {
    session = null;
    clears++;
  }
}

class FakePanelApi extends PanelApi {
  FakePanelApi({
    this.account,
    this.authorization = 'Bearer next',
    this.failure,
    this.unauthorized = false,
    this.subscription,
  }) : super(panelBaseUrl);

  PanelAccount? account;
  PanelSubscription? subscription;
  PanelApiException? failure;
  bool unauthorized;
  final String authorization;
  final calls = <String>[];

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    calls.add('login');
    if (failure != null) throw failure!;
    return authorization;
  }

  @override
  Future<PanelAccount> getAccount(String authorization) async {
    calls.add('account');
    if (unauthorized) {
      throw const PanelApiException('Session expired', statusCode: 403);
    }
    if (failure != null) throw failure!;
    return account!;
  }

  @override
  Future<PanelSubscription> getSubscription(String authorization) async {
    calls.add('subscription');
    if (failure != null) throw failure!;
    return subscription ??
        PanelSubscription(
          bytes: Uint8List.fromList(utf8.encode('proxies: []')),
        );
  }

  @override
  Future<void> logout(String authorization) async {
    calls.add('logout');
  }
}

class TestProfilesAction extends ProfilesAction {
  final synced = <String>[];
  final deleted = <int>[];
  int nextId = 11;

  @override
  void build() {}

  @override
  Future<int> syncManagedProfile({
    required Uint8List bytes,
    required String label,
    required String remoteAccountId,
    int? profileId,
    String? disposition,
    String? userinfo,
  }) async {
    synced.add('$label|$remoteAccountId|${bytes.length}|$userinfo');
    return nextId;
  }

  @override
  Future<void> deleteManagedProfile(int id) async {
    deleted.add(id);
  }
}
