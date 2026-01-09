import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/providers/xboard_provider.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:fl_clash/xboard/views/app_download_view.dart';
import 'package:fl_clash/xboard/views/xboard_login_view.dart';
import 'package:fl_clash/xboard/views/xboard_checkin_view.dart';
import 'package:fl_clash/xboard/views/xboard_invite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XboardView extends ConsumerStatefulWidget {
  const XboardView({super.key});

  @override
  ConsumerState<XboardView> createState() => _XboardViewState();
}

class _XboardViewState extends ConsumerState<XboardView> {
  bool _hasCheckedAnnouncement = false;

  @override
  void initState() {
    super.initState();
    // 检查登录状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(xboardStateProvider.notifier).checkAuthStatus();
    });
  }

  /// 检查并显示公告弹窗
  void _checkAndShowAnnouncement() {
    if (_hasCheckedAnnouncement) return;
    _hasCheckedAnnouncement = true;

    final config = ref.read(xboardConfigProvider);
    final haConfig = xboardApi.haService.lastConfig;
    final announcement = haConfig?.announcement;
    final announcementShow = haConfig?.announcementShow ?? true;
    final currentVersion = haConfig?.version ?? 0;

    // 如果公告显示开关关闭，不显示
    if (!announcementShow) return;

    // 如果没有公告内容，不显示
    if (announcement == null || announcement.isEmpty) return;

    // 如果已经显示过当前版本的公告，不再显示
    if (config.lastShownAnnouncementVersion == currentVersion) return;

    // 延迟显示，确保页面已完全加载
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      _showAnnouncementDialog(context, announcement, currentVersion);
    });
  }

  /// 显示公告弹窗并更新已显示版本
  void _showAnnouncementDialog(
    BuildContext context,
    String announcement,
    int version,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
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
            child: const Text('我知道了'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        ),
      ),
    ).then((_) {
      // 弹窗关闭后，更新已显示的公告版本
      ref.read(xboardConfigProvider.notifier).updateConfig(
            (config) =>
                config.copyWith(lastShownAnnouncementVersion: version),
          );
    });
  }

  Future<void> _handleRefresh() async {
    await ref.read(xboardStateProvider.notifier).refresh();
  }

  Future<void> _handleSyncSubscribe() async {
    final result = await globalState.appController.safeRun(
      () => ref.read(xboardStateProvider.notifier).syncSubscribeToFlClash(),
      needLoading: true,
    );
    if (result?.isSuccess == true) {
      globalState.showNotifier('订阅同步成功');
    }
  }

  Future<void> _handleLogout() async {
    final confirm = await globalState.showMessage(
      title: '退出账号',
      message: TextSpan(
        children: [
          TextSpan(
            text: '退出账号将清空所有订阅配置，是否继续？\n\n',
            style: TextStyle(
              color: context.colorScheme.onSurface,
            ),
          ),
          TextSpan(
            text: '提示：退出软件不会清除登录状态和订阅配置。',
            style: TextStyle(
              fontSize: 12,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      confirmText: '退出账号',
    );
    if (confirm == true) {
      await ref.read(xboardStateProvider.notifier).logout(clearSubscribe: true);
      globalState.showNotifier('已退出账号');
    }
  }

  void _handleOpenPurchase() {
    ref.read(xboardStateProvider.notifier).openPurchasePage();
  }

  void _handleOpenUserCenter() {
    ref.read(xboardStateProvider.notifier).openUserCenter();
  }

  void _handleOpenDownload() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AppDownloadView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final xboardState = ref.watch(xboardStateProvider);
    final uiConfig = xboardApi.uiConfig;

    // 未登录时不显示 AppBar，登录后显示带标题的 AppBar
    if (!xboardState.isLoggedIn) {
      // 重置公告检查状态，以便下次登录时重新检查
      _hasCheckedAnnouncement = false;
      return const XboardLoginView();
    }

    // 已登录且数据加载完成后，检查是否需要显示公告
    if (!xboardState.isLoading && xboardState.user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkAndShowAnnouncement();
      });
    }

    return CommonScaffold(
      title: uiConfig.title,
      actions: [
        IconButton(
          onPressed: xboardState.isLoading ? null : _handleRefresh,
          icon: const Icon(Icons.refresh),
        ),
      ],
      body: _buildLoggedInView(context, xboardState),
    );
  }

  Widget _buildLoggedInView(BuildContext context, XboardState state) {
    if (state.isLoading && state.user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 用户信息卡片
          if (state.user != null) _buildUserCard(context, state.user!),
          const SizedBox(height: 16),

          // 订阅信息卡片
          if (state.subscribe != null)
            _buildSubscribeCard(context, state.subscribe!),
          const SizedBox(height: 16),

          // 操作按钮
          _buildActionButtons(context, state),

          // 公告列表
          if (state.notices.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildNoticesSection(context, state.notices),
          ],
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, XboardUser user) {
    return CommonCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 头像
            CircleAvatar(
              radius: 30,
              backgroundColor: context.colorScheme.primaryContainer,
              backgroundImage: user.avatarUrl != null
                  ? NetworkImage(user.avatarUrl!)
                  : null,
              child: user.avatarUrl == null
                  ? Icon(
                      Icons.person,
                      size: 30,
                      color: context.colorScheme.onPrimaryContainer,
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            // 用户信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.email,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '余额: ¥${user.balanceYuan.toStringAsFixed(2)}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            // 软件下载按钮
            IconButton(
              onPressed: _handleOpenDownload,
              icon: const Icon(Icons.download_rounded),
              tooltip: '软件下载',
            ),
            // 登出按钮
            IconButton(
              onPressed: _handleLogout,
              icon: const Icon(Icons.logout),
              tooltip: '退出登录',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscribeCard(BuildContext context, XboardSubscribe subscribe) {
    final hasValidSubscribe = subscribe.hasValidSubscribe;
    final plan = subscribe.plan;

    return CommonCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题行
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('订阅信息', style: context.textTheme.titleMedium),
                if (hasValidSubscribe)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      plan?.name ?? '已订阅',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      subscribe.isExpired ? '已过期' : '未订阅',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            if (hasValidSubscribe) ...[
              // 流量进度
              _buildTrafficProgress(context, subscribe),
              const SizedBox(height: 12),

              // 流量详情
              _buildInfoRow(
                context,
                '已用流量',
                _formatTraffic(subscribe.usedTraffic),
              ),
              _buildInfoRow(
                context,
                '总流量',
                _formatTraffic(subscribe.transferEnable),
              ),

              // 到期时间
              if (subscribe.expiredAt != null) ...[
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  '到期时间',
                  _formatExpireDate(subscribe.expiredAt!),
                ),
              ],

              // 设备限制
              if (subscribe.deviceLimit != null) ...[
                _buildInfoRow(context, '设备限制', '${subscribe.deviceLimit} 台'),
              ],

              // 下次重置
              if (subscribe.nextResetAt != null) ...[
                _buildInfoRow(
                  context,
                  '流量重置',
                  _formatExpireDate(subscribe.nextResetAt!),
                ),
              ],
            ] else ...[
              // 未订阅提示
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        subscribe.isExpired
                            ? '您的订阅已过期，请续费以继续使用'
                            : '您还没有购买订阅，点击下方按钮前往购买',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTrafficProgress(
    BuildContext context,
    XboardSubscribe subscribe,
  ) {
    final progress = subscribe.trafficProgress.clamp(0.0, 1.0);
    final progressColor = progress > 0.9
        ? context.colorScheme.error
        : progress > 0.7
        ? Colors.orange
        : context.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '流量使用',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: context.textTheme.bodySmall?.copyWith(
                color: progressColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(value, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, XboardState state) {
    final hasValidSubscribe = state.subscribe?.hasValidSubscribe ?? false;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 500;
        
        return Column(
          children: [
            // 快捷操作区域 - 签到和邀请
            _buildQuickActions(context, constraints.maxWidth),
            const SizedBox(height: 12),
            
            // 操作按钮组 - 宽屏时横向排列
            if (isWide)
              _buildWideActionButtons(context, state, hasValidSubscribe)
            else
              _buildNarrowActionButtons(context, state, hasValidSubscribe),
          ],
        );
      },
    );
  }

  /// 宽屏模式下的操作按钮
  Widget _buildWideActionButtons(BuildContext context, XboardState state, bool hasValidSubscribe) {
    return Column(
      children: [
        if (hasValidSubscribe) ...[
          Row(
            children: [
              // 同步订阅按钮
              Expanded(
                flex: 2,
                child: _buildPrimaryActionButton(
                  context: context,
                  icon: Icons.sync_rounded,
                  label: '同步订阅',
                  onPressed: state.isLoading ? null : _handleSyncSubscribe,
                  isPrimary: true,
                ),
              ),
              const SizedBox(width: 10),
              // 续费按钮
              Expanded(
                flex: 2,
                child: _buildPrimaryActionButton(
                  context: context,
                  icon: Icons.shopping_cart_outlined,
                  label: '续费/升级套餐',
                  onPressed: _handleOpenPurchase,
                  isPrimary: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ] else ...[
          SizedBox(
            width: double.infinity,
            child: _buildPrimaryActionButton(
              context: context,
              icon: Icons.shopping_cart_rounded,
              label: '前往购买',
              onPressed: _handleOpenPurchase,
              isPrimary: true,
            ),
          ),
          const SizedBox(height: 8),
        ],
        // 用户中心按钮
        _buildTextActionButton(
          context: context,
          icon: Icons.open_in_new_rounded,
          label: '打开用户中心',
          onPressed: _handleOpenUserCenter,
        ),
      ],
    );
  }

  /// 窄屏模式下的操作按钮
  Widget _buildNarrowActionButtons(BuildContext context, XboardState state, bool hasValidSubscribe) {
    return Column(
      children: [
        if (hasValidSubscribe) ...[
          // 同步订阅按钮
          SizedBox(
            width: double.infinity,
            child: _buildPrimaryActionButton(
              context: context,
              icon: Icons.sync_rounded,
              label: '同步订阅',
              onPressed: state.isLoading ? null : _handleSyncSubscribe,
              isPrimary: true,
            ),
          ),
          const SizedBox(height: 10),
          // 续费按钮
          SizedBox(
            width: double.infinity,
            child: _buildPrimaryActionButton(
              context: context,
              icon: Icons.shopping_cart_outlined,
              label: '续费/升级套餐',
              onPressed: _handleOpenPurchase,
              isPrimary: false,
            ),
          ),
        ] else ...[
          SizedBox(
            width: double.infinity,
            child: _buildPrimaryActionButton(
              context: context,
              icon: Icons.shopping_cart_rounded,
              label: '前往购买',
              onPressed: _handleOpenPurchase,
              isPrimary: true,
            ),
          ),
        ],
        const SizedBox(height: 8),
        // 用户中心按钮
        _buildTextActionButton(
          context: context,
          icon: Icons.open_in_new_rounded,
          label: '打开用户中心',
          onPressed: _handleOpenUserCenter,
        ),
      ],
    );
  }

  /// 构建主要操作按钮（带动画效果）
  Widget _buildPrimaryActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    required bool isPrimary,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        splashColor: isPrimary 
            ? context.colorScheme.onPrimary.withOpacity(0.1)
            : context.colorScheme.primary.withOpacity(0.1),
        highlightColor: isPrimary
            ? context.colorScheme.onPrimary.withOpacity(0.05)
            : context.colorScheme.primary.withOpacity(0.05),
        child: Ink(
          decoration: BoxDecoration(
            color: isPrimary 
                ? context.colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isPrimary 
                ? null 
                : Border.all(
                    color: context.colorScheme.outline.withOpacity(0.4),
                    width: 1,
                  ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: isPrimary 
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isPrimary 
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 构建文字操作按钮
  Widget _buildTextActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: context.colorScheme.primary.withOpacity(0.1),
        highlightColor: context.colorScheme.primary.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: context.colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建快捷操作区域 - 签到和邀请
  Widget _buildQuickActions(BuildContext context, double maxWidth) {
    // 根据宽度决定是否使用紧凑布局
    final isCompact = maxWidth < 360;
    
    return Row(
      children: [
        // 每日签到
        Expanded(
          child: _QuickActionCard(
            icon: Icons.calendar_today_rounded,
            title: '每日签到',
            subtitle: '领取流量奖励',
            gradientColors: [
              context.colorScheme.primary,
              context.colorScheme.primary.withOpacity(0.75),
            ],
            isCompact: isCompact,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const XboardCheckinView(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // 我的邀请
        Expanded(
          child: _QuickActionCard(
            icon: Icons.card_giftcard_rounded,
            title: '我的邀请',
            subtitle: '邀请好友得佣金',
            gradientColors: [
              context.colorScheme.tertiary,
              context.colorScheme.tertiary.withOpacity(0.75),
            ],
            isCompact: isCompact,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const XboardInviteView(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoticesSection(
    BuildContext context,
    List<XboardNotice> notices,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('公告', style: context.textTheme.titleMedium),
        const SizedBox(height: 12),
        ...notices.map((notice) => _buildNoticeItem(context, notice)),
      ],
    );
  }

  Widget _buildNoticeItem(BuildContext context, XboardNotice notice) {
    return GestureDetector(
      onTap: () => _showNoticeDetailDialog(context, notice),
      child: CommonCard(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      notice.title,
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                  if (notice.createdAt != null)
                    Text(
                      _formatDate(notice.createdAt!),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                notice.content,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示公告详情对话框
  void _showNoticeDetailDialog(BuildContext context, XboardNotice notice) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.campaign_outlined,
              color: context.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                notice.title,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
        content: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (notice.createdAt != null) ...[
                  Text(
                    _formatDate(notice.createdAt!),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                SelectableText(
                  notice.content,
                  style: context.textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  String _formatTraffic(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  String _formatExpireDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final now = DateTime.now();
    final diff = date.difference(now);

    if (diff.isNegative) {
      return '已过期';
    }

    final formatted =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    if (diff.inDays > 0) {
      return '$formatted (${diff.inDays}天后)';
    } else if (diff.inHours > 0) {
      return '$formatted (${diff.inHours}小时后)';
    } else {
      return '$formatted (即将到期)';
    }
  }

  String _formatDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.month}/${date.day}';
  }
}

/// 快捷操作卡片组件 - 紧凑横向布局，带点击动画
class _QuickActionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final bool isCompact;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
    required this.onTap,
    this.isCompact = false,
  });

  @override
  State<_QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<_QuickActionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 120),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: widget.gradientColors,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: widget.gradientColors.first.withOpacity(_isPressed ? 0.1 : 0.2),
                blurRadius: _isPressed ? 4 : 10,
                offset: Offset(0, _isPressed ? 1 : 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // 图标
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              // 文字
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              // 箭头指示
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withOpacity(0.7),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
