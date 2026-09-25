# Branding

The product name is data, not source. Every user-visible string lives in a brand
profile under `brands/`, and `tool/brand.dart` rewrites the tree from it.

```bash
dart run tool/brand.dart list                 # available profiles
dart run tool/brand.dart show                 # resolved values
dart run tool/brand.dart check                # CI gate: fails on drift
dart run tool/brand.dart apply --brand acme   # rewrite the tree for a brand
dart run tool/brand.dart defines              # flutter --dart-define arguments
```

The active brand comes from `--brand`, then `FLCLASH_BRAND`, then the single
profile in `brands/`. Copy `brands/fly001.yaml` to `brands/<key>.yaml` for a new
white-label build; `display_name` must stay free of spaces and shell
metacharacters because it becomes a product and file name.

## What `apply` rewrites

| Area | Files |
| --- | --- |
| Dart defaults | `lib/common/constant.dart` (app name, repository, support URL) |
| Android | `strings.xml`, notification title and channel, shared-state default, debug manifest labels, the Kotlin tests that assert those defaults |
| macOS | `AppInfo.xcconfig` product name and copyright, `project.pbxproj` product reference, dmg title and `.app` path |
| Windows | `Runner.rc` company/description/product/copyright, window title in `main.cpp`, installer metadata |
| Linux | deb/rpm/AppImage display name, package name, generic name, maintainer, first keyword |
| Packaging and release | `distribute_options.yaml` artifact prefix, `.github/release_template.md` links and asset names, `tool/changelog.dart` repository |
| Tests | the desktop-entry expectation in `test/common/protocol_test.dart` |

Artifacts come out as `<artifact_prefix>-<version>-<platform>-<arch>.<ext>`.

## What stays frozen, and why

`brands/*.yaml` lists these under `frozen:`; `check` fails if any of them moves.

| Identifier | Value | Reason |
| --- | --- | --- |
| Android applicationId | `com.follow.clash` | renaming ships a different app: no upgrade path, and Play never allows changing it later |
| macOS bundle identifier | `com.follow.clash` | same, plus Keychain and TCC grants are keyed on it |
| Windows executable | `FlClash.exe` | shortcuts, firewall rules, autostart entries and the roaming data directory all follow it |
| Linux binary | `FlClash` | desktop entry `Exec`, package file lists, Helper path checks |
| Core name | `FlClashCore` | built by `build_config.yaml`, copied by CMake and Xcode, and hash-pinned by the Helper |
| Helper service | `FlClashHelperService` | installed as an OS service; renaming needs an uninstall/migrate path |
| Helper socket | `/run/flclash/helper.sock` | two builds must not fight over a renamed socket |
| Single-instance lock | `FlClash.lock` | renaming would let two builds run at once |
| Installer app id | the existing GUID | Windows upgrades and uninstall entries key on it |
| Protocol schemes | `clash`, `clashmeta`, `flclash` | dropping them stops ordinary subscription links from opening the app |

Renaming any of these is a coordinated migration, not a string replace: it needs
upgrade handling for installed services, data directories and lock files, plus a
full four-platform regression. Linux launcher names come from the desktop
metadata, so the visible name changes without touching the binary.

## Release automation

The upstream workflow published to the original author's Homebrew tap and F-Droid
repository and pushed announcements to their Telegram bot. Those steps are
removed; the release job now only builds, generates notes from the branded
template, checksums and publishes a GitHub release. `dart run tool/brand.dart
check` runs in the Dart job so a merge from upstream cannot silently reintroduce
the old name.

## Licensing

FlClash is GPL-3.0. Rebranding changes none of that: `LICENSE`, the upstream
copyright notices in `brands/*.yaml`, and the source attribution stay in place,
and nothing here may imply upstream endorsement of a commercial build.

## Per-platform verification

- Android: `aapt2 dump badging <apk> | grep application-label`, launcher name, notification title, tile label
- macOS: bundle file name, `plutil -extract CFBundleDisplayName`, Dock and About panel, dmg volume title
- Windows: exe properties (product name, description, company), Start menu and taskbar, window title, tray tooltip, installer and uninstall entry
- Linux: `dpkg -s <package>`, desktop entry `Name=`, launcher tile, AppImage file name
