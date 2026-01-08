import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// 软件下载页面
class AppDownloadView extends StatefulWidget {
  const AppDownloadView({super.key});

  @override
  State<AppDownloadView> createState() => _AppDownloadViewState();
}

class _AppDownloadViewState extends State<AppDownloadView> {
  bool _isLoading = true;
  AppVersionInfo? _appVersion;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    setState(() => _isLoading = true);

    // 尝试从已缓存的配置获取
    final lastConfig = xboardApi.haService.lastConfig;
    if (lastConfig?.appVersion != null) {
      setState(() {
        _appVersion = lastConfig!.appVersion;
        _isLoading = false;
      });
      return;
    }

    // 如果没有缓存，尝试重新解析
    await xboardApi.resolveAndSetBaseUrl(forceRefresh: true);
    final config = xboardApi.haService.lastConfig;

    setState(() {
      _appVersion = config?.appVersion;
      _isLoading = false;
    });
  }

  /// 构建平台下载列表
  List<_PlatformDownload> _buildPlatformList() {
    final app = _appVersion;
    if (app == null) return [];

    final platforms = <_PlatformDownload>[];

    if (app.windowsUrl != null && app.windowsUrl!.isNotEmpty) {
      platforms.add(
        _PlatformDownload(
          name: 'Windows',
          icon: Icons.laptop_windows,
          description: '适用于 Windows 10/11 系统',
          url: app.windowsUrl!,
          color: const Color(0xFF0078D4),
        ),
      );
    }

    if (app.androidUrl != null && app.androidUrl!.isNotEmpty) {
      platforms.add(
        _PlatformDownload(
          name: 'Android',
          icon: Icons.android,
          description: '适用于 Android 7.0 及以上系统',
          url: app.androidUrl!,
          color: const Color(0xFF3DDC84),
        ),
      );
    }

    if (app.linuxUrl != null && app.linuxUrl!.isNotEmpty) {
      platforms.add(
        _PlatformDownload(
          name: 'Linux',
          icon: Icons.terminal,
          description: '适用于 Ubuntu/Debian 系统',
          url: app.linuxUrl!,
          color: const Color(0xFFFCC624),
        ),
      );
    }

    if (app.macosIntelUrl != null && app.macosIntelUrl!.isNotEmpty) {
      platforms.add(
        _PlatformDownload(
          name: 'macOS (Intel)',
          icon: Icons.laptop_mac,
          description: '适用于 Intel 芯片的 Mac',
          url: app.macosIntelUrl!,
          color: const Color(0xFF555555),
        ),
      );
    }

    if (app.macosArmUrl != null && app.macosArmUrl!.isNotEmpty) {
      platforms.add(
        _PlatformDownload(
          name: 'macOS (Apple Silicon)',
          icon: Icons.laptop_mac,
          description: '适用于 M1/M2/M3/M4 芯片的 Mac',
          url: app.macosArmUrl!,
          color: const Color(0xFF555555),
        ),
      );
    }

    return platforms;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('软件下载'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _loadConfig,
            icon: const Icon(Icons.refresh),
            tooltip: '刷新',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: _buildContent(context, isMobile),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    final platforms = _buildPlatformList();

    if (platforms.isEmpty && _appVersion == null) {
      return _buildEmptyState(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题说明
        _buildHeader(context, isMobile),
        SizedBox(height: isMobile ? 20 : 28),

        // 下载列表
        if (platforms.isNotEmpty) ...[
          ...platforms.map(
            (platform) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildDownloadCard(context, platform, isMobile),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
        ],

        // iOS 特殊说明卡片
        _buildIOSCard(context, isMobile),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Icon(
            Icons.cloud_off,
            size: 64,
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无下载信息',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '请稍后重试或联系管理员',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _loadConfig,
            icon: const Icon(Icons.refresh),
            label: const Text('重新加载'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.download_rounded,
                size: isMobile ? 28 : 32,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '选择您的平台',
                    style:
                        (isMobile
                                ? context.textTheme.titleLarge
                                : context.textTheme.headlineSmall)
                            ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '下载适合您设备的客户端',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDownloadCard(
    BuildContext context,
    _PlatformDownload platform,
    bool isMobile,
  ) {
    return CommonCard(
      onPressed: () => _handleDownload(context, platform),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 14 : 16),
        child: Row(
          children: [
            // 平台图标
            Container(
              width: isMobile ? 48 : 56,
              height: isMobile ? 48 : 56,
              decoration: BoxDecoration(
                color: platform.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                platform.icon,
                size: isMobile ? 26 : 30,
                color: platform.color,
              ),
            ),
            const SizedBox(width: 16),

            // 平台信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platform.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    platform.description,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // 下载按钮
            FilledButton.icon(
              onPressed: () => _handleDownload(context, platform),
              icon: const Icon(Icons.download, size: 18),
              label: const Text('下载'),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 16,
                  vertical: isMobile ? 8 : 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIOSCard(BuildContext context, bool isMobile) {
    final app = _appVersion;
    final appName = app?.iosAppName ?? 'Shadowrocket';
    final hasAccount = app?.hasIOSAccount ?? false;

    return CommonCard(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.primaryContainer.withOpacity(0.5),
              context.colorScheme.secondaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: isMobile ? 48 : 56,
                  height: isMobile ? 48 : 56,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.phone_iphone,
                    size: isMobile ? 26 : 30,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'iOS / iPadOS',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '适用于 iPhone 和 iPad',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 使用说明
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.colorScheme.surface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: context.colorScheme.outlineVariant.withOpacity(0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 18,
                        color: context.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '使用说明',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 显示自定义说明或默认步骤
                  if (app?.iosGuide != null && app!.iosGuide!.isNotEmpty)
                    Text(app.iosGuide!, style: context.textTheme.bodyMedium)
                  else ...[
                    _buildStepItem(context, '1', '登录海外 App Store 账号'),
                    _buildStepItem(context, '2', '搜索并下载 $appName'),
                    _buildStepItem(context, '3', '打开 $appName 导入订阅链接'),
                    _buildStepItem(context, '4', '选择节点并开启代理即可使用'),
                  ],
                ],
              ),
            ),

            // 海外账号信息（如果配置了）
            if (hasAccount) ...[
              const SizedBox(height: 14),
              _buildAccountCard(context, app!),
            ],

            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        _copyToClipboard(context, appName, '已复制应用名称'),
                    icon: const Icon(Icons.copy, size: 16),
                    label: const Text('复制应用名'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _openAppStore(context),
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: const Text('打开 App Store'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(BuildContext context, AppVersionInfo app) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.colorScheme.tertiary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 18,
                color: context.colorScheme.tertiary,
              ),
              const SizedBox(width: 8),
              Text(
                '共享账号',
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.tertiary,
                ),
              ),
              const Spacer(),
              Text(
                '仅供下载使用',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildAccountRow(context, '账号', app.iosAccount!),
          if (app.iosPassword != null && app.iosPassword!.isNotEmpty)
            _buildAccountRow(context, '密码', app.iosPassword!),
        ],
      ),
    );
  }

  Widget _buildAccountRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
          IconButton(
            onPressed: () => _copyToClipboard(context, value, '$label已复制'),
            icon: const Icon(Icons.copy, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            tooltip: '复制$label',
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(BuildContext context, String step, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: context.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Future<void> _handleDownload(
    BuildContext context,
    _PlatformDownload platform,
  ) async {
    final uri = Uri.parse(platform.url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _copyToClipboard(context, platform.url, '下载链接已复制到剪贴板');
      }
    } catch (e) {
      _copyToClipboard(context, platform.url, '下载链接已复制到剪贴板');
    }
  }

  Future<void> _openAppStore(BuildContext context) async {
    final appStoreUrl =
        _appVersion?.iosAppStoreUrl ??
        'https://apps.apple.com/app/shadowrocket/id932747118';
    final uri = Uri.parse(appStoreUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _copyToClipboard(context, appStoreUrl, 'App Store 链接已复制');
      }
    } catch (e) {
      _copyToClipboard(context, appStoreUrl, 'App Store 链接已复制');
    }
  }

  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// 平台下载信息模型
class _PlatformDownload {
  final String name;
  final IconData icon;
  final String description;
  final String url;
  final Color color;

  const _PlatformDownload({
    required this.name,
    required this.icon,
    required this.description,
    required this.url,
    required this.color,
  });
}
