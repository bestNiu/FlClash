import 'dart:convert';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/providers/xboard_provider.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XboardLoginView extends ConsumerStatefulWidget {
  const XboardLoginView({super.key});

  @override
  ConsumerState<XboardLoginView> createState() => _XboardLoginViewState();
}

class _XboardLoginViewState extends ConsumerState<XboardLoginView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // 表单控制器
  final _baseUrlController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _inviteCodeController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  bool _isResolvingHA = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // 先使用默认地址作为占位
    _baseUrlController.text = XboardConstants.defaultBaseUrl;

    // 如果启用了高可用模式，总是尝试解析真实地址（强制刷新）
    final config = ref.read(xboardConfigProvider);
    if (config.enableHA) {
      // 启动时强制刷新，确保获取最新配置
      _resolveHAAddress(forceRefresh: true);
    } else if (config.baseUrl != null && config.baseUrl!.isNotEmpty) {
      // 未启用高可用时，使用缓存的地址
      _baseUrlController.text = config.baseUrl!;
    }
  }

  /// 通过高可用服务解析真实面板地址
  /// [forceRefresh] 是否强制刷新（忽略缓存）
  Future<void> _resolveHAAddress({bool forceRefresh = false}) async {
    setState(() => _isResolvingHA = true);

    // 强制刷新时忽略缓存
    final result = await xboardApi.resolveAndSetBaseUrl(
      forceRefresh: forceRefresh,
    );
    if (result.isSuccess && result.data != null) {
      // 更新输入框
      _baseUrlController.text = result.data!;

      // 保存配置（包括 UI 配置和版本号）
      final uiConfigJson = json.encode(xboardApi.uiConfig.toJson());
      ref
          .read(xboardConfigProvider.notifier)
          .updateConfig(
            (config) => config.copyWith(
              baseUrl: result.data,
              haResolvedUrl: xboardApi.haResolvedUrl,
              haResolvedTime: xboardApi.haResolvedTime,
              haConfigVersion: xboardApi.configVersion,
              cachedUiConfig: uiConfigJson,
            ),
          );
    }

    setState(() => _isResolvingHA = false);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _baseUrlController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _inviteCodeController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await ref
        .read(xboardStateProvider.notifier)
        .login(
          _baseUrlController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text,
        );

    setState(() => _isLoading = false);

    if (result.isError) {
      globalState.showNotifier(
        result.message.isNotEmpty ? result.message : '登录失败',
      );
    } else {
      globalState.showNotifier('登录成功');
    }
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      globalState.showNotifier('两次输入的密码不一致');
      return;
    }

    setState(() => _isLoading = true);

    final result = await ref
        .read(xboardStateProvider.notifier)
        .register(
          baseUrl: _baseUrlController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          inviteCode: _inviteCodeController.text.trim().isNotEmpty
              ? _inviteCodeController.text.trim()
              : null,
        );

    setState(() => _isLoading = false);

    if (result.isError) {
      globalState.showNotifier(
        result.message.isNotEmpty ? result.message : '注册失败',
      );
    } else {
      globalState.showNotifier('注册成功');
    }
  }

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入面板地址';
    }
    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      return '请输入有效的网址 (http:// 或 https://)';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入邮箱';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '请输入有效的邮箱地址';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入密码';
    }
    if (value.length < 6) {
      return '密码长度至少6位';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '请确认密码';
    }
    if (value != _passwordController.text) {
      return '两次输入的密码不一致';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo 和标题
              _buildHeader(context),
              const SizedBox(height: 32),

              // 登录/注册卡片
              CommonCard(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Tab 切换
                      TabBar(
                        controller: _tabController,
                        tabs: const [
                          Tab(text: '登录'),
                          Tab(text: '注册'),
                        ],
                        onTap: (_) {
                          // 清除表单验证状态
                          _formKey.currentState?.reset();
                        },
                      ),
                      const SizedBox(height: 24),

                      // 表单内容
                      Form(
                        key: _formKey,
                        child: AnimatedBuilder(
                          animation: _tabController,
                          builder: (context, _) {
                            return Column(
                              children: [
                                // 面板地址
                                TextFormField(
                                  controller: _baseUrlController,
                                  decoration: InputDecoration(
                                    labelText: '面板地址',
                                    hintText: XboardConstants.defaultBaseUrl,
                                    prefixIcon: const Icon(Icons.link),
                                    border: const OutlineInputBorder(),
                                    suffixIcon: _isResolvingHA
                                        ? const Padding(
                                            padding: EdgeInsets.all(12),
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          )
                                        : IconButton(
                                            icon: const Icon(Icons.refresh),
                                            tooltip: '刷新高可用地址',
                                            onPressed: () => _resolveHAAddress(
                                              forceRefresh: true,
                                            ),
                                          ),
                                  ),
                                  keyboardType: TextInputType.url,
                                  validator: _validateUrl,
                                  textInputAction: TextInputAction.next,
                                  enabled: !_isResolvingHA,
                                ),
                                const SizedBox(height: 16),

                                // 邮箱
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: '邮箱',
                                    hintText: 'user@example.com',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _validateEmail,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(height: 16),

                                // 密码
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: '密码',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _obscurePassword,
                                  validator: _validatePassword,
                                  textInputAction: _tabController.index == 0
                                      ? TextInputAction.done
                                      : TextInputAction.next,
                                  onFieldSubmitted: _tabController.index == 0
                                      ? (_) => _handleLogin()
                                      : null,
                                ),

                                // 注册时的额外字段
                                if (_tabController.index == 1) ...[
                                  const SizedBox(height: 16),
                                  // 确认密码
                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    decoration: InputDecoration(
                                      labelText: '确认密码',
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                      ),
                                      border: const OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureConfirmPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureConfirmPassword =
                                                !_obscureConfirmPassword;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscureConfirmPassword,
                                    validator: _validateConfirmPassword,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(height: 16),
                                  // 邀请码
                                  TextFormField(
                                    controller: _inviteCodeController,
                                    decoration: const InputDecoration(
                                      labelText: '邀请码 (可选)',
                                      prefixIcon: Icon(Icons.card_giftcard),
                                      border: OutlineInputBorder(),
                                    ),
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) => _handleRegister(),
                                  ),
                                ],

                                const SizedBox(height: 24),

                                // 提交按钮
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: FilledButton(
                                    onPressed: _isLoading
                                        ? null
                                        : (_tabController.index == 0
                                              ? _handleLogin
                                              : _handleRegister),
                                    child: _isLoading
                                        ? const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            _tabController.index == 0
                                                ? '登录'
                                                : '注册',
                                          ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 底部提示文字
              Text(
                xboardApi.uiConfig.footerText,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final uiConfig = xboardApi.uiConfig;

    return Column(
      children: [
        // 面板图标
        if (uiConfig.iconUrl != null && uiConfig.iconUrl!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              uiConfig.iconUrl!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildDefaultIcon(context),
            ),
          )
        else
          _buildDefaultIcon(context),
        const SizedBox(height: 16),
        // 面板名称
        Text(
          uiConfig.panelName,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // 欢迎语
        Text(
          uiConfig.welcomeText,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultIcon(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        Icons.cloud_sync,
        size: 48,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
