import 'package:flutter/material.dart';
import 'package:fl_clash/services/xboard_auth_service.dart';
import 'package:fl_clash/services/xboard_subscription_service.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';

class XboardDashboardPage extends StatefulWidget {
  final VoidCallback? onLogout;

  const XboardDashboardPage({super.key, this.onLogout});

  @override
  State<XboardDashboardPage> createState() => _XboardDashboardPageState();
}

class _XboardDashboardPageState extends State<XboardDashboardPage> {
  final XboardAuthService _authService = XboardAuthService();
  final XboardSubscriptionService _subscriptionService =
      XboardSubscriptionService();

  XboardSubscriptionInfo? _subscriptionInfo;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // 加载数据
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 刷新用户信息和订阅信息
      await _authService.refreshUserInfo();
      _subscriptionInfo = await _subscriptionService.getSubscriptionInfo();

      // 如果有当前订阅，也更新FlClash中的配置
      if (_subscriptionInfo != null) {
        await _updateSubscriptionProfile();
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 更新订阅配置文件
  Future<void> _updateSubscriptionProfile() async {
    try {
      if (_subscriptionInfo?.subscribeUrl == null) return;

      // 查找是否已经存在Xboard配置
      final profiles = globalState.config.profiles;
      final xboardProfile = profiles
          .where((p) =>
              p.url == _subscriptionInfo!.subscribeUrl ||
              p.label?.contains('Xboard') == true)
          .firstOrNull;

      if (xboardProfile != null) {
        // 更新现有配置
        await globalState.appController.updateProfile(xboardProfile);
      }
    } catch (e) {
      // 更新失败不影响页面显示
      debugPrint('更新订阅配置失败: $e');
    }
  }

  // 导入配置到FlClash
  Future<void> _importConfig() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final subscriptionUrl = await _subscriptionService.getSubscriptionUrl();

      if (subscriptionUrl != null && subscriptionUrl.isNotEmpty) {
        // 使用FlClash的原生方法导入配置
        globalState.appController.addProfileFormURL(subscriptionUrl);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('正在导入配置，请稍候...'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('获取订阅地址失败')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导入配置失败: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 刷新数据和配置
  Future<void> _refreshAll() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 刷新用户信息
      await _authService.refreshUserInfo();

      // 刷新订阅信息
      _subscriptionInfo = await _subscriptionService.getSubscriptionInfo();

      // 刷新FlClash中的所有配置
      await globalState.appController.updateProfiles();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('数据刷新完成'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 获取流量使用信息
  String _getTrafficUsageInfo() {
    if (_subscriptionInfo == null) {
      return _authService.userTrafficInfo; // 回退到用户信息中的总流量
    }

    // 从订阅信息中获取准确的流量数据
    final used = _subscriptionInfo!.u + _subscriptionInfo!.d; // 上传 + 下载
    final total = _subscriptionInfo!.transferEnable;

    if (total == 0) return '无限制';

    final usedGB = (used / (1024 * 1024 * 1024)).toStringAsFixed(2);
    final totalGB = (total / (1024 * 1024 * 1024)).toStringAsFixed(2);
    final percentage =
        total > 0 ? ((used / total) * 100).toStringAsFixed(1) : '0.0';

    return '$usedGB GB / $totalGB GB ($percentage%)';
  }

  // 显示登出确认对话框
  Future<void> _showLogoutConfirmDialog() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认登出'),
          content: const Text('您确定要登出Xboard账户吗？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('登出'),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await _logout();
    }
  }

  // 执行登出操作
  Future<void> _logout() async {
    // 显示加载状态
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('正在登出...'),
          duration: Duration(seconds: 1),
        ),
      );
    }

    try {
      // 清除认证信息和用户数据
      await _authService.logout();

      if (mounted) {
        // 显示登出成功提示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('已安全登出'),
            duration: Duration(seconds: 1),
          ),
        );

        // 调用回调或返回上级页面
        if (widget.onLogout != null) {
          widget.onLogout!();
        } else {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('登出失败: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xboard 仪表板'),
        actions: [
          IconButton(
            onPressed: _refreshAll,
            icon: const Icon(Icons.refresh),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'logout':
                  _showLogoutConfirmDialog();
                  break;
                case 'account':
                  // 可以添加账户信息页面
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'account',
                child: Row(
                  children: [
                    Icon(Icons.account_circle,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    const Text('账户信息'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout,
                        color: Theme.of(context).colorScheme.error),
                    const SizedBox(width: 8),
                    Text('安全登出',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              '加载失败',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              _errorMessage!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshAll,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息卡片
            _buildUserInfoCard(),
            const SizedBox(height: 16),

            // 订阅信息卡片
            if (_subscriptionInfo != null) _buildSubscriptionInfoCard(),
            const SizedBox(height: 16),

            // 快捷操作
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard() {
    final user = _authService.currentUser;

    if (user == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(Icons.person_off, size: 48),
              const SizedBox(height: 8),
              Text(
                '用户信息加载失败',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: user.avatarUrl.isNotEmpty
                      ? NetworkImage(user.avatarUrl)
                      : null,
                  child:
                      user.avatarUrl.isEmpty ? const Icon(Icons.person) : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'UUID: ${user.uuid}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '流量使用',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        _getTrafficUsageInfo(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '到期时间',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        _authService.userExpireInfo,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '账户余额',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        _authService.userBalanceInfo,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                if (_authService.isUserBanned)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '已禁用',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError,
                        fontSize: 12,
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

  Widget _buildSubscriptionInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '订阅信息',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (_subscriptionInfo!.plan != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.subscriptions,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('计划名称: ${_subscriptionInfo!.plan!.name}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.devices,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('设备限制: ${_subscriptionInfo!.plan!.deviceLimit}台'),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                Icon(
                  Icons.link,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '订阅链接: ${_subscriptionInfo!.subscribeUrl}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (_subscriptionInfo!.resetDay != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.refresh,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('重置日期: 每月${_subscriptionInfo!.resetDay}号'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '快捷操作',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _importConfig,
                    icon: const Icon(Icons.download),
                    label: const Text('导入配置'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _refreshAll,
                    icon: const Icon(Icons.sync),
                    label: const Text('刷新全部'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // 跳转到FlClash的配置页面
                      globalState.appController.toProfiles();
                    },
                    icon: const Icon(Icons.settings),
                    label: const Text('管理配置'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showLogoutConfirmDialog,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text('安全登出'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
