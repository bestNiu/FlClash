import 'package:flutter/material.dart';
import 'package:fl_clash/services/xboard_auth_service.dart';
import 'package:fl_clash/pages/xboard_login_page.dart';
import 'package:fl_clash/pages/xboard_dashboard_page.dart';

class XboardView extends StatefulWidget {
  const XboardView({super.key});

  @override
  State<XboardView> createState() => _XboardViewState();
}

class _XboardViewState extends State<XboardView>
    with AutomaticKeepAliveClientMixin {
  final XboardAuthService _authService = XboardAuthService();
  bool _isInitialized = false;
  bool _isLoggedIn = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    try {
      await _authService.initialize();

      // 检查自动登录
      final isLoggedIn = await _authService.checkAutoLogin();

      setState(() {
        _isInitialized = true;
        _isLoggedIn = isLoggedIn;
      });
    } catch (e) {
      setState(() {
        _isInitialized = true;
        _isLoggedIn = false;
      });
    }
  }

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (!_isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_isLoggedIn) {
      return XboardLoginPage(
        onLoginSuccess: _onLoginSuccess,
      );
    }

    return XboardDashboardPage(
      onLogout: _onLogout,
    );
  }
}
