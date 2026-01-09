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

/// 邀请信息弹窗
class XboardInviteSheet extends ConsumerStatefulWidget {
  const XboardInviteSheet({super.key});

  @override
  ConsumerState<XboardInviteSheet> createState() => _XboardInviteSheetState();
}

class _XboardInviteSheetState extends ConsumerState<XboardInviteSheet> {
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
    final config = ref.watch(xboardConfigProvider);
    final baseUrl = config.baseUrl ?? XboardConstants.defaultBaseUrl;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 拖动手柄
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // 标题
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.card_giftcard_rounded,
                    color: context.colorScheme.onPrimaryContainer,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '我的邀请',
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '邀请好友注册，获得佣金奖励',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // 内容
          Flexible(
            child: _isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(48),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : _error != null
                    ? _buildErrorView()
                    : _buildContent(baseUrl),
          ),
          // 底部安全区域
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 16),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: context.colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            _error ?? '加载失败',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          FilledButton.tonal(
            onPressed: _loadInviteInfo,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(String baseUrl) {
    final codes = _inviteInfo?.codes ?? [];
    final stat = _inviteInfo?.stat;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 邀请统计卡片
          if (stat != null) _buildStatCard(stat),
          const SizedBox(height: 16),
          
          // 邀请码列表
          _buildCodeListHeader(),
          const SizedBox(height: 12),
          
          if (codes.isEmpty)
            _buildEmptyCodeView()
          else
            ...codes.map((code) => _buildCodeCard(code, baseUrl)),
        ],
      ),
    );
  }

  Widget _buildCodeListHeader() {
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
                  style: context.textTheme.titleMedium?.copyWith(
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
                        size: 16,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      label: Text(
                        '上限',
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
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.add, size: 18),
                    label: const Text('生成'),
                  ),
          ],
        ),
        // 达到上限时显示提示信息
        if (_hasReachedLimit) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: context.colorScheme.tertiary.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: context.colorScheme.tertiary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '已达上限，请分享现有邀请码',
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

  Widget _buildStatCard(XboardInviteStat stat) {
    return CommonCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _buildStatItem(
                icon: Icons.people_outline,
                label: '已邀请',
                value: '${stat.registeredCount} 人',
                color: context.colorScheme.primary,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: context.colorScheme.outlineVariant,
            ),
            Expanded(
              child: _buildStatItem(
                icon: Icons.percent,
                label: '佣金比例',
                value: '${stat.commissionRate}%',
                color: context.colorScheme.secondary,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: context.colorScheme.outlineVariant,
            ),
            Expanded(
              child: _buildStatItem(
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
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 6),
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

  Widget _buildEmptyCodeView() {
    return CommonCard(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.loyalty_outlined,
              size: 48,
              color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 12),
            Text(
              '暂无邀请码',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '点击上方"生成"按钮创建邀请码',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeCard(XboardInviteCode code, String baseUrl) {
    final inviteUrl = code.generateInviteUrl(baseUrl);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CommonCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 邀请码
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      code.code,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    onPressed: () => _copyToClipboard(code.code, '邀请码'),
                    icon: const Icon(Icons.copy, size: 18),
                    tooltip: '复制邀请码',
                    visualDensity: VisualDensity.compact,
                  ),
                  const Spacer(),
                  Text(
                    '已使用 ${code.pv} 次',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 邀请链接
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
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
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
}

/// 显示邀请信息弹窗
Future<void> showInviteSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const XboardInviteSheet(),
  );
}

