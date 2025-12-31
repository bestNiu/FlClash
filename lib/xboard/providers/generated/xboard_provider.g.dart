// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../xboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Xboard 配置 Provider（持久化）

@ProviderFor(XboardConfigNotifier)
const xboardConfigProvider = XboardConfigNotifierProvider._();

/// Xboard 配置 Provider（持久化）
final class XboardConfigNotifierProvider
    extends $NotifierProvider<XboardConfigNotifier, XboardConfig> {
  /// Xboard 配置 Provider（持久化）
  const XboardConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'xboardConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$xboardConfigNotifierHash();

  @$internal
  @override
  XboardConfigNotifier create() => XboardConfigNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(XboardConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<XboardConfig>(value),
    );
  }
}

String _$xboardConfigNotifierHash() =>
    r'af90cf7228ec77339814d774dfe4f703213e185f';

/// Xboard 配置 Provider（持久化）

abstract class _$XboardConfigNotifier extends $Notifier<XboardConfig> {
  XboardConfig build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<XboardConfig, XboardConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<XboardConfig, XboardConfig>,
              XboardConfig,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Xboard 状态 Provider（运行时）

@ProviderFor(XboardStateNotifier)
const xboardStateProvider = XboardStateNotifierProvider._();

/// Xboard 状态 Provider（运行时）
final class XboardStateNotifierProvider
    extends $NotifierProvider<XboardStateNotifier, XboardState> {
  /// Xboard 状态 Provider（运行时）
  const XboardStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'xboardStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$xboardStateNotifierHash();

  @$internal
  @override
  XboardStateNotifier create() => XboardStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(XboardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<XboardState>(value),
    );
  }
}

String _$xboardStateNotifierHash() =>
    r'46604c02eb0a570d553ecd53b3c10a7497f93540';

/// Xboard 状态 Provider（运行时）

abstract class _$XboardStateNotifier extends $Notifier<XboardState> {
  XboardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<XboardState, XboardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<XboardState, XboardState>,
              XboardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 是否已登录 Xboard

@ProviderFor(isXboardLoggedIn)
const isXboardLoggedInProvider = IsXboardLoggedInProvider._();

/// 是否已登录 Xboard

final class IsXboardLoggedInProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否已登录 Xboard
  const IsXboardLoggedInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isXboardLoggedInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isXboardLoggedInHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isXboardLoggedIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isXboardLoggedInHash() => r'd37d79e15f38f9a8b593e2034a06193fbc7d6440';

/// Xboard 用户信息

@ProviderFor(xboardUser)
const xboardUserProvider = XboardUserProvider._();

/// Xboard 用户信息

final class XboardUserProvider
    extends $FunctionalProvider<XboardUser?, XboardUser?, XboardUser?>
    with $Provider<XboardUser?> {
  /// Xboard 用户信息
  const XboardUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'xboardUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$xboardUserHash();

  @$internal
  @override
  $ProviderElement<XboardUser?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  XboardUser? create(Ref ref) {
    return xboardUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(XboardUser? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<XboardUser?>(value),
    );
  }
}

String _$xboardUserHash() => r'a5857d8cbc0bbab340a8d7488c7c37de2ec8f6de';

/// Xboard 订阅信息

@ProviderFor(xboardSubscribe)
const xboardSubscribeProvider = XboardSubscribeProvider._();

/// Xboard 订阅信息

final class XboardSubscribeProvider
    extends
        $FunctionalProvider<
          XboardSubscribe?,
          XboardSubscribe?,
          XboardSubscribe?
        >
    with $Provider<XboardSubscribe?> {
  /// Xboard 订阅信息
  const XboardSubscribeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'xboardSubscribeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$xboardSubscribeHash();

  @$internal
  @override
  $ProviderElement<XboardSubscribe?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  XboardSubscribe? create(Ref ref) {
    return xboardSubscribe(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(XboardSubscribe? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<XboardSubscribe?>(value),
    );
  }
}

String _$xboardSubscribeHash() => r'9722d4c87d64380996777c776c025cbef163908b';

/// 是否有有效订阅

@ProviderFor(hasValidXboardSubscribe)
const hasValidXboardSubscribeProvider = HasValidXboardSubscribeProvider._();

/// 是否有有效订阅

final class HasValidXboardSubscribeProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否有有效订阅
  const HasValidXboardSubscribeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasValidXboardSubscribeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasValidXboardSubscribeHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasValidXboardSubscribe(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasValidXboardSubscribeHash() =>
    r'f090e55196e2abe0c1cf99f37c50fb7058f830fe';
