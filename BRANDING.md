# fly001 branding

The default user-facing product name is `fly001`. Stable internal identifiers remain unchanged during the first migration phase to preserve Android upgrades, native IPC and helper compatibility.

Dart build-time overrides:

```bash
flutter build <target> \
  --dart-define=FLY001_APP_NAME=fly001 \
  --dart-define=FLY001_REPOSITORY=bestNiu/FlClash \
  --dart-define=FLY001_SUPPORT_URL=https://support.example.internal
```

Native package names, Core/Helper binary names and protocol handlers must only be renamed in a coordinated migration with signing and upgrade tests.

Commercial authorization documents are maintained outside the public source repository. Existing upstream license and attribution files remain unchanged.
