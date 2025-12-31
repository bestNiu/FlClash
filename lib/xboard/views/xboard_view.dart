import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/providers/xboard_provider.dart';
import 'package:fl_clash/xboard/views/xboard_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XboardView extends ConsumerStatefulWidget {
  const XboardView({super.key});

  @override
  ConsumerState<XboardView> createState() => _XboardViewState();
}

class _XboardViewState extends ConsumerState<XboardView> {
  @override
  void initState() {
    super.initState();
    // 检查登录状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(xboardStateProvider.notifier).checkAuthStatus();
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
      title: '确认登出',
      message: const TextSpan(text: '确定要退出登录吗？'),
    );
    if (confirm == true) {
      await ref.read(xboardStateProvider.notifier).logout();
    }
  }

  void _handleOpenPurchase() {
    ref.read(xboardStateProvider.notifier).openPurchasePage();
  }

  void _handleOpenUserCenter() {
    ref.read(xboardStateProvider.notifier).openUserCenter();
  }

  @override
  Widget build(BuildContext context) {
    final xboardState = ref.watch(xboardStateProvider);

    return CommonScaffold(
      title: 'Xboard',
      actions: xboardState.isLoggedIn
          ? [
              IconButton(
                onPressed: xboardState.isLoading ? null : _handleRefresh,
                icon: const Icon(Icons.refresh),
              ),
            ]
          : null,
      body: xboardState.isLoggedIn
          ? _buildLoggedInView(context, xboardState)
          : const XboardLoginView(),
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
              backgroundImage:
                  user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
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
                Text(
                  '订阅信息',
                  style: context.textTheme.titleMedium,
                ),
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
                _buildInfoRow(
                  context,
                  '设备限制',
                  '${subscribe.deviceLimit} 台',
                ),
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
      BuildContext context, XboardSubscribe subscribe) {
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
          Text(
            value,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, XboardState state) {
    final hasValidSubscribe = state.subscribe?.hasValidSubscribe ?? false;

    return Column(
      children: [
        if (hasValidSubscribe) ...[
          // 同步订阅按钮
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: state.isLoading ? null : _handleSyncSubscribe,
              icon: const Icon(Icons.sync),
              label: const Text('同步订阅到 FlClash'),
            ),
          ),
          const SizedBox(height: 12),
        ],

        // 前往购买/续费按钮
        SizedBox(
          width: double.infinity,
          child: hasValidSubscribe
              ? OutlinedButton.icon(
                  onPressed: _handleOpenPurchase,
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text('续费/升级套餐'),
                )
              : FilledButton.icon(
                  onPressed: _handleOpenPurchase,
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('前往购买'),
                ),
        ),
        const SizedBox(height: 12),

        // 用户中心按钮
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            onPressed: _handleOpenUserCenter,
            icon: const Icon(Icons.open_in_new),
            label: const Text('打开用户中心'),
          ),
        ),
      ],
    );
  }

  Widget _buildNoticesSection(
      BuildContext context, List<XboardNotice> notices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '公告',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        ...notices.map((notice) => _buildNoticeItem(context, notice)),
      ],
    );
  }

  Widget _buildNoticeItem(BuildContext context, XboardNotice notice) {
    return CommonCard(
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

