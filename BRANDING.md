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
| Application identity | Android `applicationId` and `applicationIdSuffix`, macOS `PRODUCT_BUNDLE_IDENTIFIER` (release through `AppInfo.xcconfig`, Debug through `project.pbxproj`) and `INFOPLIST_KEY_CFBundleDisplayName`, Linux `APPLICATION_ID` in `linux/CMakeLists.txt` |
| Android | `strings.xml`, notification title and channel, shared-state default, debug manifest labels, the Kotlin tests that assert those defaults |
| macOS | `AppInfo.xcconfig` product name and copyright, `project.pbxproj` product reference, dmg title and `.app` path |
| Windows | `Runner.rc` company/description/product/copyright, window title in `main.cpp`, installer metadata |
| Linux | deb/rpm/AppImage display name, package name, generic name, maintainer, first keyword |
| Packaging and release | `distribute_options.yaml` artifact prefix, `.github/release_template.md` links and asset names, `tool/changelog.dart` repository |
| Tests | the desktop-entry expectation in `test/common/protocol_test.dart` |

Artifacts come out as `<artifact_prefix>-<version>-<platform>-<arch>.<ext>`.

### Application identity

`identity.bundle_id` is the reverse-DNS application id used on all three
platforms that have one, and `identity.debug_suffix` is appended for debug
builds. Changing it moves every per-app location the operating system derives
from the id:

| Platform | Data directory follows | Value for `fly001` |
| --- | --- | --- |
| Android | `applicationId` | `/data/data/com.fly001.app` |
| macOS | `PRODUCT_BUNDLE_IDENTIFIER` | `~/Library/Application Support/com.fly001.app` |
| Linux | the GTK `APPLICATION_ID` | `~/.local/share/com.fly001.app` |
| Windows | VERSIONINFO `CompanyName`/`ProductName` | `%APPDATA%\fly001\fly001` |

Two consequences are deliberate and must not be "fixed" by accident:

- A new brand is a new application. Nothing is inherited from an upstream
  FlClash install, and no import step is offered; that was an explicit product
  decision, so do not add migration code without revisiting it.
- The single-instance lock lives inside the data directory, so separate bundle
  ids also mean two builds can run at the same time. The lock file name itself
  stays frozen.

`android/app/google-services.json` must carry a client entry for both
`<bundle_id>` and `<bundle_id><debug_suffix>`, otherwise the Google services
plugin fails the Android build with "No matching client found for package
name". `check` asserts both entries. When you replace the placeholder file with
a real Firebase project, re-upload the `SERVICE_JSON` repository secret too:
CI overwrites the tracked file with that secret.

Once a build ships, set `identity.published: true` and record
`identity.published_bundle_id`. `check` then fails on any further change,
because the stores treat the application id as the permanent app key.

## What stays frozen, and why

`brands/*.yaml` lists these under `frozen:`; `check` fails if any of them moves.

| Identifier | Value | Reason |
| --- | --- | --- |
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
metadata, so the visible name changes without touching the binary. The macOS
`RunnerTests` bundle identifier stays upstream on purpose; only the app target
follows the brand.

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
