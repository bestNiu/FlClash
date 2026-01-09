import 'dart:convert';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/providers/xboard_provider.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:fl_clash/xboard/views/app_download_view.dart';
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
    if (!mounted) return;

    // 强制刷新时忽略缓存
    final result = await xboardApi.resolveAndSetBaseUrl(
      forceRefresh: forceRefresh,
    );

    // 异步操作完成后检查 widget 是否还存在
    if (!mounted) return;

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
      // 登录成功后跳转到仪表盘页面
      globalState.appController.toPage(PageLabel.dashboard);
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
      // 注册成功后跳转到仪表盘页面
      globalState.appController.toPage(PageLabel.dashboard);
    }
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
    // 判断是否为手机端（窄屏）
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final horizontalPadding = isMobile ? 16.0 : 24.0;
    final topPadding = isMobile ? 24.0 : 48.0;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: topPadding,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo 和标题
                _buildHeader(context, isMobile),
                SizedBox(height: isMobile ? 20 : 32),

                // 登录/注册卡片
                CommonCard(
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : 20),
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
                        SizedBox(height: isMobile ? 16 : 24),

                        // 表单内容
                        Form(
                          key: _formKey,
                          child: AnimatedBuilder(
                            animation: _tabController,
                            builder: (context, _) {
                              return Column(
                                children: [
                                  // 邮箱
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: '邮箱',
                                      hintText: 'user@example.com',
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      border: const OutlineInputBorder(),
                                      isDense: isMobile,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _validateEmail,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  SizedBox(height: isMobile ? 12 : 16),

                                  // 密码
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      labelText: '密码',
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                      ),
                                      border: const OutlineInputBorder(),
                                      isDense: isMobile,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
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
                                    SizedBox(height: isMobile ? 12 : 16),
                                    // 确认密码
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      decoration: InputDecoration(
                                        labelText: '确认密码',
                                        prefixIcon: const Icon(
                                          Icons.lock_outline,
                                        ),
                                        border: const OutlineInputBorder(),
                                        isDense: isMobile,
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
                                    SizedBox(height: isMobile ? 12 : 16),
                                    // 邀请码
                                    TextFormField(
                                      controller: _inviteCodeController,
                                      decoration: InputDecoration(
                                        labelText: '邀请码 (可选)',
                                        prefixIcon: const Icon(
                                          Icons.card_giftcard,
                                        ),
                                        border: const OutlineInputBorder(),
                                        isDense: isMobile,
                                      ),
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (_) =>
                                          _handleRegister(),
                                    ),
                                  ],

                                  SizedBox(height: isMobile ? 16 : 24),

                                  // 提交按钮
                                  SizedBox(
                                    width: double.infinity,
                                    height: isMobile ? 44 : 48,
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

                SizedBox(height: isMobile ? 12 : 16),

                // 公告区域
                _buildAnnouncementSection(context, isMobile),

                // 底部提示文字
                Text(
                  xboardApi.uiConfig.footerText,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: isMobile ? 16 : 20),

                // 软件下载按钮
                TextButton.icon(
                  onPressed: () => _openDownloadPage(context),
                  icon: const Icon(Icons.download_rounded, size: 18),
                  label: const Text('软件下载'),
                  style: TextButton.styleFrom(
                    foregroundColor: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDownloadPage(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const AppDownloadView()));
  }

  /// 构建公告区域
  Widget _buildAnnouncementSection(BuildContext context, bool isMobile) {
    final haConfig = xboardApi.haService.lastConfig;
    final announcement = haConfig?.announcement;
    final announcementShow = haConfig?.announcementShow ?? true;

    // 如果公告显示开关关闭或没有公告内容，不显示
    if (!announcementShow || announcement == null || announcement.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () => _showAnnouncementDialog(context, announcement, isMobile),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 16,
              vertical: isMobile ? 10 : 12,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.campaign_outlined,
                  size: isMobile ? 18 : 20,
                  color: context.colorScheme.primary,
                ),
                SizedBox(width: isMobile ? 8 : 10),
                Expanded(
                  child: Text(
                    announcement,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: isMobile ? 18 : 20,
                  color: context.colorScheme.onPrimaryContainer.withOpacity(
                    0.6,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
      ],
    );
  }

  /// 显示公告详情对话框
  void _showAnnouncementDialog(
    BuildContext context,
    String announcement,
    bool isMobile,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 移动端宽度限制更窄，桌面端适中
    final dialogWidth = isMobile ? screenWidth * 0.85 : 360.0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.campaign_outlined,
              color: context.colorScheme.primary,
              size: isMobile ? 22 : 24,
            ),
            const SizedBox(width: 8),
            Text(
              '公告',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: Container(
          width: dialogWidth,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            maxWidth: dialogWidth,
          ),
          child: SingleChildScrollView(
            child: SelectableText(
              announcement,
              style: context.textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontSize: isMobile ? 14 : 15,
              ),
            ),
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(
          isMobile ? 20 : 24,
          16,
          isMobile ? 20 : 24,
          8,
        ),
        actionsPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: 8,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    final uiConfig = xboardApi.uiConfig;
    final iconSize = isMobile ? 64.0 : 80.0;
    final borderRadius = isMobile ? 16.0 : 20.0;

    return Column(
      children: [
        // 面板图标
        if (uiConfig.iconUrl != null && uiConfig.iconUrl!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              uiConfig.iconUrl!,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildDefaultIcon(context, isMobile),
            ),
          )
        else
          _buildDefaultIcon(context, isMobile),
        SizedBox(height: isMobile ? 12 : 16),
        // 面板名称
        Text(
          uiConfig.panelName,
          style:
              (isMobile
                      ? context.textTheme.titleLarge
                      : context.textTheme.headlineSmall)
                  ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: isMobile ? 4 : 8),
        // 欢迎语
        Text(
          uiConfig.welcomeText,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDefaultIcon(BuildContext context, bool isMobile) {
    final iconSize = isMobile ? 64.0 : 80.0;
    final borderRadius = isMobile ? 16.0 : 20.0;
    final innerIconSize = isMobile ? 36.0 : 48.0;

    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        Icons.cloud_sync,
        size: innerIconSize,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
