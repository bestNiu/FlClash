import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import 'panel_account_provider.dart';
import 'panel_models.dart';

class AccountView extends ConsumerStatefulWidget {
  const AccountView({super.key});

  @override
  ConsumerState<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends ConsumerState<AccountView> {
  late final TextEditingController _panelController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _panelController = TextEditingController(text: defaultPanelUrl);
  }

  @override
  void dispose() {
    _panelController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() != true) return;
    await ref
        .read(panelAccountProvider.notifier)
        .login(
          baseUrl: _panelController.text,
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(panelAccountProvider);
    // A failed refresh still shows the last account, not the sign-in form.
    final account =
        state.value ?? ref.read(panelAccountProvider.notifier).lastKnown;
    final error = state.error?.toString();
    return BaseScaffold(
      title: context.appLocalizations.account,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (account == null)
            _LoginForm(
              formKey: _formKey,
              panelController: _panelController,
              emailController: _emailController,
              passwordController: _passwordController,
              loading: state.isLoading,
              error: error,
              onLogin: _login,
              onRetry: () {
                ref.read(panelAccountProvider.notifier).refresh();
              },
              onLogout: () {
                ref.read(panelAccountProvider.notifier).logout();
              },
            )
          else
            _AccountSummary(
              account: account,
              error: error,
              loading: state.isLoading,
            ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController panelController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool loading;
  final String? error;
  final VoidCallback onLogin;
  final VoidCallback onRetry;
  final VoidCallback onLogout;

  const _LoginForm({
    required this.formKey,
    required this.panelController,
    required this.emailController,
    required this.passwordController,
    required this.loading,
    required this.error,
    required this.onLogin,
    required this.onRetry,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.appLocalizations;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: panelController,
            enabled: !loading,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: l10n.panelAddress),
            validator: (value) =>
                value?.trim().isEmpty == false ? null : l10n.requiredField,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: emailController,
            enabled: !loading,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.username],
            decoration: InputDecoration(labelText: l10n.email),
            validator: (value) =>
                value?.trim().isEmpty == false ? null : l10n.requiredField,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            enabled: !loading,
            obscureText: true,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(labelText: l10n.password),
            validator: (value) =>
                value?.isNotEmpty == true ? null : l10n.requiredField,
            onFieldSubmitted: (_) => onLogin(),
          ),
          if (error != null) ...[
            const SizedBox(height: 12),
            Text(error!, style: TextStyle(color: context.colorScheme.error)),
            const SizedBox(height: 8),
            Row(
              children: [
                TextButton.icon(
                  onPressed: loading ? null : onRetry,
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.sync),
                ),
                TextButton.icon(
                  onPressed: loading ? null : onLogout,
                  icon: const Icon(Icons.logout),
                  label: Text(l10n.logout),
                ),
              ],
            ),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: loading ? null : onLogin,
            child: loading
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.login),
          ),
        ],
      ),
    );
  }
}

class _AccountSummary extends ConsumerWidget {
  final PanelAccount account;
  final String? error;
  final bool loading;

  const _AccountSummary({
    required this.account,
    this.error,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.appLocalizations;
    final expiration = account.expiration;
    final date = expiration == null
        ? l10n.noExpiration
        : DateFormat.yMd(
            Localizations.localeOf(context).toLanguageTag(),
          ).format(expiration.toLocal());
    final status = switch (account.statusAt(DateTime.now())) {
      PanelAccountStatus.noPlan => l10n.noSubscription,
      PanelAccountStatus.active => l10n.subscriptionActive,
      PanelAccountStatus.expiring => l10n.subscriptionExpiring,
      PanelAccountStatus.expired => l10n.subscriptionExpired,
      PanelAccountStatus.unavailable => l10n.subscriptionUnavailable,
    };
    return Column(
      children: [
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: context.colorScheme.error),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    error!,
                    style: TextStyle(color: context.colorScheme.error),
                  ),
                ),
                if (loading)
                  const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(account.email),
          subtitle: Text(account.planName ?? l10n.noSubscription),
        ),
        ListTile(
          leading: const Icon(Icons.verified_outlined),
          title: Text(status),
        ),
        ListTile(
          leading: const Icon(Icons.data_usage),
          title: Text(l10n.trafficUsage),
          subtitle: Text(
            '${_formatBytes(account.used)} / ${_formatBytes(account.total)}',
          ),
        ),
        ListTile(
          leading: const Icon(Icons.event_outlined),
          title: Text(l10n.expireTime),
          subtitle: Text(date),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                ref.read(panelAccountProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: Text(l10n.sync),
            ),
            const SizedBox(width: 12),
            FilledButton.tonalIcon(
              onPressed: () {
                ref.read(panelAccountProvider.notifier).logout();
              },
              icon: const Icon(Icons.logout),
              label: Text(l10n.logout),
            ),
          ],
        ),
      ],
    );
  }
}

String _formatBytes(int bytes) {
  if (bytes <= 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  var value = bytes.toDouble();
  var unit = 0;
  while (value >= 1024 && unit < units.length - 1) {
    value /= 1024;
    unit++;
  }
  final precision = value >= 10 || unit == 0 ? 0 : 1;
  return '${value.toStringAsFixed(precision)} ${units[unit]}';
}
