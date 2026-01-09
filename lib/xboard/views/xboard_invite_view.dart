import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/providers/xboard_provider.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 邀请页面 - 独立页面版本，支持桌面端和移动端
class XboardInviteView extends ConsumerStatefulWidget {
  const XboardInviteView({super.key});

  @override
  ConsumerState<XboardInviteView> createState() => _XboardInviteViewState();
}

class _XboardInviteViewState extends ConsumerState<XboardInviteView> {
  bool _isLoading = true;
  bool _isGenerating = false;
  XboardInviteInfo? _inviteInfo;
  String? _error;
  
  /// 是否已达到邀请码创建上限
  bool _hasReachedLimit = false;

  @override
  void initState() {
    super.initState();
    _loadInviteInfo();
  }

  Future<void> _loadInviteInfo() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await xboardApi.getInviteInfo();

    if (!mounted) return;

    if (result.isSuccess) {
      setState(() {
        _inviteInfo = result.data;
        _isLoading = false;
      });
    } else {
      setState(() {
        _error = result.message;
        _isLoading = false;
      });
    }
  }

  Future<void> _generateInviteCode() async {
    setState(() => _isGenerating = true);

    final result = await xboardApi.generateInviteCode();

    if (!mounted) return;

    if (result.isSuccess) {
      globalState.showNotifier('邀请码生成成功');
      await _loadInviteInfo();
    } else {
      // 检查是否是达到上限的错误
      final isLimitError = result.message.contains('上限') || 
                           result.message.contains('limit') ||
                           result.message.contains('达到');
      if (isLimitError) {
        setState(() => _hasReachedLimit = true);
      }
      
      // 检查是否是邀请码已生成但需要刷新的情况
      final needRefresh = result.message.contains('已生成') || 
                          result.message.contains('刷新');
      if (needRefresh) {
        globalState.showNotifier('邀请码生成成功');
        await _loadInviteInfo();
      } else {
        globalState.showNotifier(
          result.message.isNotEmpty ? result.message : '生成失败',
        );
      }
    }

    setState(() => _isGenerating = false);
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    globalState.showNotifier('$label 已复制到剪贴板');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 600;
    final config = ref.watch(xboardConfigProvider);
    final baseUrl = config.baseUrl ?? XboardConstants.defaultBaseUrl;

    return CommonScaffold(
      title: '我的邀请',
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? _buildErrorView(isDesktop)
                : _buildContent(baseUrl, isDesktop),
      ),
    );
  }

  Widget _buildErrorView(bool isDesktop) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: isDesktop ? 480 : double.infinity),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: context.colorScheme.errorContainer.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: context.colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _error ?? '加载失败',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.tonal(
              onPressed: _loadInviteInfo,
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String baseUrl, bool isDesktop) {
    if (isDesktop) {
      return _buildDesktopLayout(baseUrl);
    } else {
      return _buildMobileLayout(baseUrl);
    }
  }

  /// 桌面端布局 - 双栏布局
  Widget _buildDesktopLayout(String baseUrl) {
    final codes = _inviteInfo?.codes ?? [];
    final stat = _inviteInfo?.stat;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部标题区域
              _buildHeaderSection(isDesktop: true),
              const SizedBox(height: 32),

              // 双栏布局
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 左侧 - 统计信息
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        if (stat != null) _buildStatCard(stat, isDesktop: true),
                        const SizedBox(height: 24),
                        _buildHowItWorksCard(isDesktop: true),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  // 右侧 - 邀请码列表
                  Expanded(
                    flex: 6,
                    child: CommonCard(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCodeListHeader(isDesktop: true),
                            const SizedBox(height: 20),
                            if (codes.isEmpty)
                              _buildEmptyCodeView(isDesktop: true)
                            else
                              ...codes.map(
                                  (code) => _buildCodeCard(code, baseUrl, isDesktop: true)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 移动端布局 - 单栏滚动
  Widget _buildMobileLayout(String baseUrl) {
    final codes = _inviteInfo?.codes ?? [];
    final stat = _inviteInfo?.stat;

    return RefreshIndicator(
      onRefresh: _loadInviteInfo,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部介绍
            _buildHeaderSection(isDesktop: false),
            const SizedBox(height: 20),

            // 邀请统计卡片
            if (stat != null) _buildStatCard(stat, isDesktop: false),
            const SizedBox(height: 20),

            // 邀请码列表
            _buildCodeListHeader(isDesktop: false),
            const SizedBox(height: 12),

            if (codes.isEmpty)
              _buildEmptyCodeView(isDesktop: false)
            else
              ...codes.map((code) => _buildCodeCard(code, baseUrl, isDesktop: false)),

            const SizedBox(height: 20),
            _buildHowItWorksCard(isDesktop: false),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection({required bool isDesktop}) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 28 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(isDesktop ? 16 : 12),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.card_giftcard_rounded,
              color: context.colorScheme.primary,
              size: isDesktop ? 36 : 28,
            ),
          ),
          SizedBox(width: isDesktop ? 20 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '邀请好友',
                  style: (isDesktop
                          ? context.textTheme.headlineSmall
                          : context.textTheme.titleLarge)
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '分享您的邀请码，好友注册成功后您将获得佣金奖励',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(XboardInviteStat stat, {required bool isDesktop}) {
    return CommonCard(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24 : 16),
        child: isDesktop
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '邀请统计',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildStatItem(
                    icon: Icons.people_outline,
                    label: '已邀请用户',
                    value: '${stat.registeredCount} 人',
                    color: context.colorScheme.primary,
                    isDesktop: isDesktop,
                  ),
                  const SizedBox(height: 16),
                  _buildStatItem(
                    icon: Icons.percent,
                    label: '佣金比例',
                    value: '${stat.commissionRate}%',
                    color: context.colorScheme.secondary,
                    isDesktop: isDesktop,
                  ),
                  const SizedBox(height: 16),
                  _buildStatItem(
                    icon: Icons.account_balance_wallet_outlined,
                    label: '累计佣金',
                    value: '¥${stat.totalCommissionYuan.toStringAsFixed(2)}',
                    color: context.colorScheme.tertiary,
                    isDesktop: isDesktop,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: _buildMobileStatItem(
                      icon: Icons.people_outline,
                      label: '已邀请',
                      value: '${stat.registeredCount} 人',
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: context.colorScheme.outlineVariant,
                  ),
                  Expanded(
                    child: _buildMobileStatItem(
                      icon: Icons.percent,
                      label: '佣金比例',
                      value: '${stat.commissionRate}%',
                      color: context.colorScheme.secondary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: context.colorScheme.outlineVariant,
                  ),
                  Expanded(
                    child: _buildMobileStatItem(
                      icon: Icons.account_balance_wallet_outlined,
                      label: '总佣金',
                      value: '¥${stat.totalCommissionYuan.toStringAsFixed(2)}',
                      color: context.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required bool isDesktop,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeListHeader({required bool isDesktop}) {
    final codes = _inviteInfo?.codes ?? [];
    final codesCount = codes.length;
    final isButtonDisabled = _isGenerating || _hasReachedLimit;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '我的邀请码',
                  style: (isDesktop
                          ? context.textTheme.titleLarge
                          : context.textTheme.titleMedium)
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (codesCount > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$codesCount',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            _hasReachedLimit
                ? Tooltip(
                    message: '已达到邀请码创建数量上限',
                    child: FilledButton.tonalIcon(
                      onPressed: null,
                      icon: Icon(
                        Icons.block,
                        size: 18,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      label: Text(
                        isDesktop ? '已达上限' : '上限',
                        style: TextStyle(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                : FilledButton.tonalIcon(
                    onPressed: isButtonDisabled ? null : _generateInviteCode,
                    icon: _isGenerating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.add, size: 20),
                    label: Text(isDesktop ? '生成邀请码' : '生成'),
                  ),
          ],
        ),
        // 达到上限时显示提示信息
        if (_hasReachedLimit) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: context.colorScheme.tertiary.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 18,
                  color: context.colorScheme.tertiary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '您已达到邀请码创建数量上限，请分享现有邀请码邀请好友',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildEmptyCodeView({required bool isDesktop}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 48 : 32),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outlineVariant.withOpacity(0.5),
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.loyalty_outlined,
            size: isDesktop ? 64 : 52,
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无邀请码',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击上方"生成"按钮创建您的专属邀请码',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCodeCard(XboardInviteCode code, String baseUrl, {required bool isDesktop}) {
    final inviteUrl = code.generateInviteUrl(baseUrl);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CommonCard(
        child: Padding(
          padding: EdgeInsets.all(isDesktop ? 20 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 邀请码行
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 16 : 12,
                        vertical: isDesktop ? 10 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.confirmation_number_outlined,
                            size: 18,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              code.code,
                              style: (isDesktop
                                      ? context.textTheme.titleMedium
                                      : context.textTheme.titleSmall)
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                                color: context.colorScheme.onPrimaryContainer,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.tonal(
                    onPressed: () => _copyToClipboard(code.code, '邀请码'),
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 16 : 12,
                        vertical: isDesktop ? 12 : 10,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.copy, size: 18),
                        if (isDesktop) ...[
                          const SizedBox(width: 6),
                          const Text('复制'),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 使用次数
              Row(
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 16,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '已使用 ${code.pv} 次',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (code.limit != null) ...[
                    Text(
                      ' / 限制 ${code.limit} 次',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              // 邀请链接
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.link,
                      size: 16,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        inviteUrl,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: () => _copyToClipboard(inviteUrl, '邀请链接'),
                      icon: const Icon(Icons.copy, size: 16),
                      label: const Text('复制链接'),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorksCard({required bool isDesktop}) {
    return CommonCard(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.help_outline,
                    size: 20,
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '如何邀请？',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStepItem(
              step: '1',
              title: '生成邀请码',
              description: '点击"生成"按钮创建您的专属邀请码',
              isDesktop: isDesktop,
            ),
            _buildStepItem(
              step: '2',
              title: '分享给好友',
              description: '将邀请码或邀请链接分享给您的好友',
              isDesktop: isDesktop,
            ),
            _buildStepItem(
              step: '3',
              title: '好友注册',
              description: '好友使用您的邀请码完成注册',
              isDesktop: isDesktop,
            ),
            _buildStepItem(
              step: '4',
              title: '获得佣金',
              description: '好友购买套餐后，您将获得相应比例的佣金',
              isDesktop: isDesktop,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem({
    required String step,
    required String title,
    required String description,
    required bool isDesktop,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

