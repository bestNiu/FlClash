import 'dart:math' as math;
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:fl_clash/xboard/models/xboard_models.dart';
import 'package:fl_clash/xboard/services/xboard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 签到页面 - 自适应布局版本
class XboardCheckinView extends ConsumerStatefulWidget {
  const XboardCheckinView({super.key});

  @override
  ConsumerState<XboardCheckinView> createState() => _XboardCheckinViewState();
}

class _XboardCheckinViewState extends ConsumerState<XboardCheckinView>
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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _loadCheckinStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        if (result.message.contains('暂不支持') ||
            result.message.contains('404')) {
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
      
      // 签到成功后重新获取签到状态，更新连续签到天数等统计数据
      _refreshCheckinStatus();
    } else {
      setState(() {
        _error = result.message;
        _isCheckinLoading = false;
        if (result.message.contains('已签到') ||
            result.message.contains('已经签到')) {
          _hasCheckedIn = true;
          _error = null;
          // 如果提示已签到，也刷新状态数据
          _refreshCheckinStatus();
        }
      });
    }
  }

  /// 刷新签到状态（不显示加载状态）
  Future<void> _refreshCheckinStatus() async {
    final result = await xboardApi.getCheckinStatus();

    if (!mounted) return;

    if (result.isSuccess && result.data != null) {
      setState(() {
        _checkinStatus = result.data;
        _hasCheckedIn = result.data!.isCheckedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: '每日签到',
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 根据可用高度和宽度计算布局参数
            final availableWidth = constraints.maxWidth;
            final availableHeight = constraints.maxHeight;
            
            // 判断布局模式
            final isCompact = availableWidth < 400;
            final isWide = availableWidth > 600;
            final isTall = availableHeight > 500;
            
            if (_isLoadingStatus) {
              return _buildLoadingView();
            }
            if (_isNotSupported) {
              return _buildNotSupportedView(isWide);
            }
            return _buildAdaptiveContent(
              availableWidth: availableWidth,
              availableHeight: availableHeight,
              isCompact: isCompact,
              isWide: isWide,
              isTall: isTall,
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 36,
            height: 36,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
          const SizedBox(height: 16),
          Text(
            '加载中...',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotSupportedView(bool isWide) {
    final iconSize = isWide ? 80.0 : 64.0;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                color: context.colorScheme.errorContainer.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.block_rounded,
                size: iconSize * 0.5,
                color: context.colorScheme.error,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '签到功能不可用',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '当前面板暂不支持此功能',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdaptiveContent({
    required double availableWidth,
    required double availableHeight,
    required bool isCompact,
    required bool isWide,
    required bool isTall,
  }) {
    // 计算自适应参数
    final contentMaxWidth = isWide ? 500.0 : double.infinity;
    final horizontalPadding = isCompact ? 16.0 : (isWide ? 32.0 : 24.0);
    final verticalPadding = isTall ? 24.0 : 16.0;
    
    // 图标大小：根据屏幕尺寸自适应
    final iconSize = _calculateIconSize(availableWidth, availableHeight);
    // 间距系数
    final spacingFactor = isTall ? 1.0 : 0.7;
    
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: contentMaxWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 签到图标区域
              _buildCheckinIconSection(
                iconSize: iconSize,
                isWide: isWide,
                isTall: isTall,
              ),
              SizedBox(height: 20 * spacingFactor),
              
              // 标题和描述
              _buildTitleSection(isWide: isWide),
              SizedBox(height: 20 * spacingFactor),
              
              // 统计信息
              if (_checkinStatus != null) ...[
                _buildStatsSection(
                  isCompact: isCompact,
                  isWide: isWide,
                ),
                SizedBox(height: 20 * spacingFactor),
              ],
              
              // 操作区域（签到按钮或结果）
              _buildActionSection(isWide: isWide),
              SizedBox(height: 16 * spacingFactor),
              
              // 提示信息
              _buildTipSection(isCompact: isCompact),
            ],
          ),
        ),
      ),
    );
  }

  /// 计算图标大小 - 根据屏幕尺寸自适应
  double _calculateIconSize(double width, double height) {
    // 基于屏幕最小边计算
    final minDimension = math.min(width, height);
    
    if (minDimension < 400) {
      return 72; // 小屏幕
    } else if (minDimension < 600) {
      return 88; // 中等屏幕
    } else {
      return 100; // 大屏幕
    }
  }

  Widget _buildCheckinIconSection({
    required double iconSize,
    required bool isWide,
    required bool isTall,
  }) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: math.sin(_animationController.value * math.pi * 2) * 0.05,
            child: child,
          ),
        );
      },
      child: Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _hasCheckedIn
                ? [
                    context.colorScheme.tertiary,
                    context.colorScheme.tertiary.withOpacity(0.7),
                  ]
                : [
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0.7),
                  ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (_hasCheckedIn
                      ? context.colorScheme.tertiary
                      : context.colorScheme.primary)
                  .withOpacity(0.3),
              blurRadius: iconSize * 0.2,
              offset: Offset(0, iconSize * 0.08),
            ),
          ],
        ),
        child: Icon(
          _hasCheckedIn
              ? Icons.check_rounded
              : Icons.calendar_today_rounded,
          size: iconSize * 0.45,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTitleSection({required bool isWide}) {
    final titleStyle = isWide
        ? context.textTheme.headlineSmall
        : context.textTheme.titleLarge;
    final descStyle = isWide
        ? context.textTheme.bodyLarge
        : context.textTheme.bodyMedium;

    return Column(
      children: [
        Text(
          _hasCheckedIn ? '今日已签到' : '每日签到',
          style: titleStyle?.copyWith(
            fontWeight: FontWeight.bold,
            color: _hasCheckedIn ? context.colorScheme.tertiary : null,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          _hasCheckedIn
              ? '明天再来签到领取更多流量'
              : '每天签到可获得随机流量奖励',
          style: descStyle?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatsSection({
    required bool isCompact,
    required bool isWide,
  }) {
    final status = _checkinStatus!;
    
    return CommonCard(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isCompact ? 16 : 24,
          vertical: isCompact ? 14 : 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(
              icon: Icons.local_fire_department_rounded,
              value: '${status.continuousDays}',
              label: '连续签到',
              color: Colors.orange,
              isCompact: isCompact,
              isWide: isWide,
            ),
            Container(
              width: 1,
              height: isCompact ? 36 : 44,
              color: context.colorScheme.outlineVariant.withOpacity(0.5),
            ),
            _buildStatItem(
              icon: Icons.calendar_month_rounded,
              value: '${status.monthCheckinDays}',
              label: '本月签到',
              color: context.colorScheme.primary,
              isCompact: isCompact,
              isWide: isWide,
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
    required bool isCompact,
    required bool isWide,
  }) {
    final iconSize = isCompact ? 18.0 : (isWide ? 24.0 : 20.0);
    final valueStyle = isCompact
        ? context.textTheme.titleLarge
        : (isWide ? context.textTheme.headlineSmall : context.textTheme.titleLarge);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: color),
            const SizedBox(width: 6),
            Text(
              value,
              style: valueStyle?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              ' 天',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection({required bool isWide}) {
    // 签到成功显示奖励
    if (_hasCheckedIn && _checkinResult != null) {
      return _buildRewardCard(isWide: isWide);
    }
    
    // 已签到但无结果
    if (_hasCheckedIn) {
      return _buildCompletedCard(isWide: isWide);
    }
    
    // 错误状态
    if (_error != null) {
      return _buildErrorCard(isWide: isWide);
    }
    
    // 签到按钮
    return _buildCheckinButton(isWide: isWide);
  }

  Widget _buildRewardCard({required bool isWide}) {
    final result = _checkinResult!;
    final padding = isWide ? 24.0 : 20.0;
    final iconSize = isWide ? 48.0 : 40.0;
    
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.tertiaryContainer.withOpacity(0.5),
              context.colorScheme.tertiaryContainer.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.celebration_rounded,
              size: iconSize,
              color: context.colorScheme.tertiary,
            ),
            const SizedBox(height: 12),
            Text(
              '🎉 签到成功',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              result.traffic > 0
                  ? '+${result.formattedTraffic}'
                  : (result.message ?? '签到奖励已发放'),
              style: (isWide
                      ? context.textTheme.headlineSmall
                      : context.textTheme.titleLarge)
                  ?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCard({required bool isWide}) {
    final padding = isWide ? 24.0 : 20.0;
    final iconSize = isWide ? 44.0 : 36.0;
    
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.tertiaryContainer.withOpacity(0.4),
              context.colorScheme.tertiaryContainer.withOpacity(0.15),
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: iconSize,
              color: context.colorScheme.tertiary,
            ),
            const SizedBox(height: 12),
            Text(
              '今日签到已完成',
              style: (isWide
                      ? context.textTheme.titleMedium
                      : context.textTheme.titleSmall)
                  ?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '明天继续保持哦~',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onTertiaryContainer.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard({required bool isWide}) {
    final padding = isWide ? 20.0 : 16.0;
    
    return CommonCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: isWide ? 40 : 32,
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

  Widget _buildCheckinButton({required bool isWide}) {
    final buttonHeight = isWide ? 52.0 : 48.0;
    final iconSize = isWide ? 22.0 : 20.0;
    final textStyle = isWide
        ? context.textTheme.titleMedium
        : context.textTheme.titleSmall;
    
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isCheckinLoading ? null : _handleCheckin,
          borderRadius: BorderRadius.circular(14),
          splashColor: Colors.white.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.05),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary,
                  context.colorScheme.primary.withOpacity(0.85),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: _isCheckinLoading
                  ? SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.touch_app_rounded,
                          size: iconSize,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '立即签到',
                          style: textStyle?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTipSection({required bool isCompact}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isCompact ? 10 : 12,
        horizontal: isCompact ? 14 : 16,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: isCompact ? 16 : 18,
            color: context.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              '签到获得的流量将自动添加到您的账户',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
