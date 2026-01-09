import 'dart:math' as math;
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 签到功能弹窗
class XboardCheckinSheet extends ConsumerStatefulWidget {
  const XboardCheckinSheet({super.key});

  @override
  ConsumerState<XboardCheckinSheet> createState() => _XboardCheckinSheetState();
}

class _XboardCheckinSheetState extends ConsumerState<XboardCheckinSheet>
    with SingleTickerProviderStateMixin {
  bool _isLoadingStatus = true;
  bool _isCheckinLoading = false;
  bool _hasCheckedIn = false;
  XboardCheckinResult? _checkinResult;
  XboardCheckinStatus? _checkinStatus;
  String? _error;
  bool _isNotSupported = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );
    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
    
    // 初始化时检查签到状态
    _loadCheckinStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// 加载签到状态
  Future<void> _loadCheckinStatus() async {
    setState(() {
      _isLoadingStatus = true;
      _error = null;
    });

    final result = await xboardApi.getCheckinStatus();

    if (!mounted) return;

    if (result.isSuccess && result.data != null) {
      setState(() {
        _checkinStatus = result.data;
        _hasCheckedIn = result.data!.isCheckedIn;
        _isLoadingStatus = false;
      });
    } else {
      setState(() {
        _isLoadingStatus = false;
        // 检查是否是不支持签到功能
        if (result.message.contains('暂不支持') || result.message.contains('404')) {
          _isNotSupported = true;
          _error = '当前面板暂不支持签到功能';
        }
      });
    }
  }

  Future<void> _handleCheckin() async {
    if (_isCheckinLoading || _hasCheckedIn) return;

    setState(() {
      _isCheckinLoading = true;
      _error = null;
    });

    // 播放动画
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    final result = await xboardApi.checkin();

    if (!mounted) return;

    if (result.isSuccess && result.data != null) {
      setState(() {
        _checkinResult = result.data;
        _hasCheckedIn = true;
        _isCheckinLoading = false;
      });
      globalState.showNotifier('签到成功！');
    } else {
      setState(() {
        _error = result.message;
        _isCheckinLoading = false;
        // 如果是"已签到"的错误，也标记为已签到状态
        if (result.message.contains('已签到') || result.message.contains('已经签到')) {
          _hasCheckedIn = true;
          _error = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          // 内容
          Padding(
            padding: const EdgeInsets.all(24),
            child: _isLoadingStatus
                ? _buildLoadingView()
                : _isNotSupported
                    ? _buildNotSupportedView()
                    : _buildMainContent(),
          ),
          // 底部安全区域
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 16),
        ],
      ),
    );
  }

  Widget _buildLoadingView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          '正在加载签到状态...',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildNotSupportedView() {
    return Column(
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
            Icons.block_rounded,
            size: 40,
            color: context.colorScheme.error,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '签到功能不可用',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '当前面板暂不支持签到功能',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('知道了'),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 签到图标
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: math.sin(_rotateAnimation.value * math.pi * 4) * 0.1,
                child: child,
              ),
            );
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _hasCheckedIn
                    ? [
                        context.colorScheme.tertiary.withOpacity(0.8),
                        context.colorScheme.tertiary,
                      ]
                    : [
                        context.colorScheme.primary.withOpacity(0.8),
                        context.colorScheme.primary,
                      ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (_hasCheckedIn
                          ? context.colorScheme.tertiary
                          : context.colorScheme.primary)
                      .withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              _hasCheckedIn
                  ? Icons.check_circle_outline
                  : Icons.calendar_today_rounded,
              size: 48,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // 标题
        Text(
          _hasCheckedIn ? '今日已签到' : '每日签到',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        
        // 描述
        Text(
          _hasCheckedIn
              ? '明天再来签到领取更多流量'
              : '每天签到可获得随机流量奖励',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        
        // 签到统计
        if (_checkinStatus != null) ...[
          const SizedBox(height: 20),
          _buildCheckinStats(),
        ],
        
        const SizedBox(height: 24),
        
        // 签到结果或按钮
        if (_hasCheckedIn && _checkinResult != null)
          _buildCheckinResult()
        else if (_hasCheckedIn && _checkinResult == null)
          _buildAlreadyCheckedIn()
        else if (_error != null)
          _buildErrorView()
        else
          _buildCheckinButton(),
        
        const SizedBox(height: 16),
        
        // 提示信息
        CommonCard(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 18,
                  color: context.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '签到获得的流量将自动添加到您的账户',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 构建签到统计信息
  Widget _buildCheckinStats() {
    final status = _checkinStatus!;
    return CommonCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              icon: Icons.local_fire_department_rounded,
              value: '${status.continuousDays}',
              label: '连续签到',
              color: Colors.orange,
            ),
            Container(
              width: 1,
              height: 30,
              color: context.colorScheme.outlineVariant,
            ),
            _buildStatItem(
              icon: Icons.calendar_month_rounded,
              value: '${status.monthCheckinDays}',
              label: '本月签到',
              color: context.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 4),
            Text(
              value,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              ' 天',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
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

  Widget _buildAlreadyCheckedIn() {
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.tertiaryContainer.withOpacity(0.5),
              context.colorScheme.tertiaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: 40,
              color: context.colorScheme.tertiary,
            ),
            const SizedBox(height: 12),
            Text(
              '今日已完成签到',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '明天继续保持哦~',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckinButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(
        onPressed: _isCheckinLoading ? null : _handleCheckin,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: _isCheckinLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.touch_app_rounded, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    '立即签到',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCheckinResult() {
    final result = _checkinResult!;
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.tertiaryContainer.withOpacity(0.5),
              context.colorScheme.tertiaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.celebration_rounded,
              size: 32,
              color: context.colorScheme.tertiary,
            ),
            const SizedBox(height: 12),
            Text(
              '🎉 签到成功',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              result.traffic > 0 ? '+${result.formattedTraffic}' : (result.message ?? '签到成功'),
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 32,
              color: context.colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(
              _error ?? '签到失败',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: _handleCheckin,
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 显示签到弹窗
Future<void> showCheckinSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const XboardCheckinSheet(),
  );
}
