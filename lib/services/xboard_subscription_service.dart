import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/services/xboard_auth_service.dart';

class XboardSubscriptionService {
  static XboardSubscriptionService? _instance;
  factory XboardSubscriptionService() =>
      _instance ??= XboardSubscriptionService._internal();
  XboardSubscriptionService._internal();

  final XboardAuthService _authService = XboardAuthService();

  // 获取订阅信息
  Future<XboardSubscriptionInfo?> getSubscriptionInfo() async {
    try {
      final response = await _authService.apiClient.getSubscriptionInfo();

      if (response.status == 'success' && response.data != null) {
        return response.data;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // 获取订阅URL
  Future<String?> getSubscriptionUrl() async {
    try {
      final subscriptionInfo = await getSubscriptionInfo();
      return subscriptionInfo?.subscribeUrl;
    } catch (e) {
      return null;
    }
  }

  // 获取用户流量使用情况
  Future<Map<String, dynamic>?> getTrafficUsage() async {
    try {
      final subscriptionInfo = await getSubscriptionInfo();
      if (subscriptionInfo == null) return null;

      final used = subscriptionInfo.u + subscriptionInfo.d;
      final total = subscriptionInfo.transferEnable;
      final remaining = total - used;

      return {
        'used': used,
        'total': total,
        'remaining': remaining,
        'usedGB': (used / (1024 * 1024 * 1024)).toStringAsFixed(2),
        'totalGB': (total / (1024 * 1024 * 1024)).toStringAsFixed(2),
        'remainingGB': (remaining / (1024 * 1024 * 1024)).toStringAsFixed(2),
        'percentage':
            total > 0 ? ((used / total) * 100).toStringAsFixed(1) : '0.0',
      };
    } catch (e) {
      return null;
    }
  }

  // 获取订阅过期信息
  Future<Map<String, dynamic>?> getExpireInfo() async {
    try {
      final subscriptionInfo = await getSubscriptionInfo();
      if (subscriptionInfo == null) return null;

      final expireTimestamp = subscriptionInfo.expiredAt;
      final expireDate =
          DateTime.fromMillisecondsSinceEpoch(expireTimestamp * 1000);
      final now = DateTime.now();

      final isExpired = expireDate.isBefore(now);
      final daysRemaining = expireDate.difference(now).inDays;

      return {
        'expireDate': expireDate,
        'isExpired': isExpired,
        'daysRemaining': daysRemaining,
        'expireDateString':
            '${expireDate.year}-${expireDate.month.toString().padLeft(2, '0')}-${expireDate.day.toString().padLeft(2, '0')}',
      };
    } catch (e) {
      return null;
    }
  }

  // 检查订阅状态
  Future<bool> isSubscriptionActive() async {
    try {
      final expireInfo = await getExpireInfo();
      return expireInfo?['isExpired'] == false;
    } catch (e) {
      return false;
    }
  }

  // 获取订阅计划信息
  Future<XboardPlan?> getPlanInfo() async {
    try {
      final subscriptionInfo = await getSubscriptionInfo();
      return subscriptionInfo?.plan;
    } catch (e) {
      return null;
    }
  }
}
