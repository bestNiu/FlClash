part of '../action.dart';

@Riverpod(keepAlive: true)
class ProfilesAction extends _$ProfilesAction {
  CoreController get _core => ref.read(coreHandlerProvider);

  @override
  void build() {}

  void updateCurrentSelectedMap(String groupName, String proxyName) {
    final currentProfile = ref.read(currentProfileProvider);
    if (currentProfile != null &&
        currentProfile.selectedMap[groupName] != proxyName) {
      final selectedMap = Map<String, String>.from(currentProfile.selectedMap)
        ..[groupName] = proxyName;
      ref
          .read(profilesProvider.notifier)
          .put(currentProfile.copyWith(selectedMap: selectedMap));
    }
  }

  Future<void> deleteProfile(int id) async {
    await ref.read(profilesProvider.notifier).del(id);
    await clearEffect(id);
    final currentProfileId = ref.read(currentProfileIdProvider);
    if (currentProfileId == id) {
      final profiles = ref.read(profilesProvider);
      if (profiles.isNotEmpty) {
        final updateId = profiles.first.id;
        ref.read(currentProfileIdProvider.notifier).value = updateId;
      } else {
        ref.read(currentProfileIdProvider.notifier).value = null;
        unawaited(ref.read(setupActionProvider.notifier).setRunning(false));
      }
    }
  }

  Future<String> validateConfigWithData(String data) async {
    return _core.validateConfigWithData(data);
  }

  Future<void> autoUpdateProfiles() async {
    for (final profile in ref.read(profilesProvider)) {
      if (!profile.autoUpdate) continue;
      final isNotNeedUpdate = profile.lastUpdateDate
          ?.add(profile.autoUpdateDuration)
          .isBeforeNow;
      if (isNotNeedUpdate == false || profile.type == ProfileType.file) {
        continue;
      }
      try {
        await updateProfile(profile);
      } catch (e) {
        commonPrint.log(compactError(e), logLevel: LogLevel.warning);
      }
    }
  }

  void putProfile(Profile profile) {
    ref.read(profilesProvider.notifier).put(profile);
    if (ref.read(currentProfileIdProvider) != null) return;
    ref.read(currentProfileIdProvider.notifier).value = profile.id;
  }

  Future<void> updateProfiles() async {
    for (final profile in ref.read(profilesProvider)) {
      if (profile.type == ProfileType.file) continue;
      await updateProfile(profile);
    }
  }

  Future<void> updateProfile(
    Profile profile, {
    bool showLoading = false,
  }) async {
    final operation = showLoading
        ? ref.read(updatingKeysProvider.notifier).start(profile.updatingKey)
        : null;
    try {
      ref.read(profilesProvider.notifier).put(profile);
      final newProfile = await profile.update(
        validate: (path) => _core.validateConfig(path),
      );
      ref.read(profilesProvider.notifier).put(newProfile);
      if (profile.id == ref.read(currentProfileIdProvider)) {
        ref
            .read(setupActionProvider.notifier)
            .applyProfileDebounce(silence: true);
      }
    } finally {
      if (operation != null) {
        ref
            .read(updatingKeysProvider.notifier)
            .stop(profile.updatingKey, operation);
      }
    }
  }

  Future<void> addProfileFormFile() async {
    final platformFile = await globalState.safeRun(picker.pickerFile);
    if (platformFile == null) return;
    final bytes = await platformFile.readBytes();
    globalState.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    ref.read(currentPageLabelProvider.notifier).toProfiles();
    final profile = await globalState.loadingRun(
      tag: LoadingTag.profiles,
      () async {
        return Profile.normal(
          label: platformFile.name,
        ).saveFile(bytes, validate: (path) => _core.validateConfig(path));
      },
      title: currentAppLocalizations.addProfile,
    );
    if (profile != null) {
      putProfile(profile);
    }
  }

  Future<int> syncManagedProfile({
    required Uint8List bytes,
    required String label,
    required String remoteAccountId,
    int? profileId,
    String? disposition,
    String? userinfo,
  }) async {
    final profiles = ref.read(profilesProvider);
    final profileById = profiles.getProfile(profileId);
    final isManagedForAccount =
        profileById?.managed == true &&
        profileById?.source == ProfileSource.managed &&
        profileById?.remoteAccountId == remoteAccountId;
    final isLegacyManaged =
        profileId != null &&
        profileById != null &&
        !profileById.managed &&
        profileById.label == label &&
        profileById.url.isNotEmpty;
    final existing = isManagedForAccount || isLegacyManaged
        ? profileById
        : profiles
              .where(
                (profile) =>
                    profile.managed &&
                    profile.source == ProfileSource.managed &&
                    profile.remoteAccountId == remoteAccountId,
              )
              .firstOrNull;
    final profile = (existing ?? Profile.normal(label: label)).copyWith(
      label: (existing?.label ?? label).takeFirstValid([
        getFileNameForDisposition(disposition),
        label,
      ]),
      url: '',
      autoUpdate: false,
      subscriptionInfo: SubscriptionInfo.formHString(userinfo),
      source: ProfileSource.managed,
      managed: true,
      remoteAccountId: remoteAccountId,
    );
    final updated = await profile.saveFile(
      bytes,
      validate: (path) => _core.validateConfig(path),
    );
    final currentProfileId = ref.read(currentProfileIdProvider);
    final shouldSelect =
        currentProfileId == null || currentProfileId == profileById?.id;
    putProfile(updated);
    if (profileById?.managed == true &&
        profileById?.source == ProfileSource.managed &&
        profileById?.id != updated.id) {
      await deleteProfile(profileById!.id);
    }
    if (shouldSelect) {
      ref.read(currentProfileIdProvider.notifier).value = updated.id;
      ref
          .read(setupActionProvider.notifier)
          .applyProfileDebounce(silence: true);
    }
    return updated.id;
  }

  Future<void> deleteManagedProfile(int id) async {
    final profile = ref.read(profilesProvider).getProfile(id);
    if (profile == null) return;
    final isManaged =
        profile.managed && profile.source == ProfileSource.managed;
    final isLegacyManaged =
        !profile.managed && profile.label == appName && profile.url.isNotEmpty;
    if (!isManaged && !isLegacyManaged) return;
    await deleteProfile(id);
  }

  Future<void> addProfileFormURL(String url) async {
    if (globalState.navigatorKey.currentState?.canPop() ?? false) {
      globalState.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
    ref.read(currentPageLabelProvider.notifier).value = PageLabel.profiles;
    final profile = await globalState.loadingRun(
      tag: LoadingTag.profiles,
      () async {
        return Profile.normal(
          url: url,
        ).update(validate: (path) => _core.validateConfig(path));
      },
      title: currentAppLocalizations.addProfile,
    );
    if (profile != null) {
      putProfile(profile);
    }
  }

  void setProfileAndAutoApply(Profile profile) {
    ref.read(profilesProvider.notifier).put(profile);
    if (profile.id == ref.read(currentProfileIdProvider)) {
      ref.read(setupActionProvider.notifier).applyProfileDebounce();
    }
  }

  Future<void> addProfileFormQrCode() async {
    final url = await globalState.safeRun(picker.pickerConfigQRCode);
    if (url == null) return;
    unawaited(addProfileFormURL(url));
  }

  void reorder(List<Profile> profiles) {
    ref.read(profilesProvider.notifier).reorder(profiles);
  }

  Future<void> clearEffect(int profileId) async {
    final profilePath = await appPath.getProfilePath(profileId.toString());
    final profileFile = File(profilePath);
    final isExists = await profileFile.exists();
    if (isExists) {
      await profileFile.safeDelete(recursive: true);
    }
    try {
      final error = await _core.clearEffect(profileId);
      if (error.isNotEmpty) {
        commonPrint.log(error, logLevel: LogLevel.warning);
      }
    } catch (error) {
      commonPrint.log(
        'clearEffect($profileId) failed: $error',
        logLevel: coreFailureLogLevel(error),
      );
    }
  }
}
