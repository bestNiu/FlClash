# Xboard 登录逻辑修改总结

## 修改目标
将 Xboard 登录从应用启动时自动弹出改为只在配置界面（添加订阅/导入 profile）时触发。

## 修改前
- 应用启动时自动弹出登录框
- 主页加载时自动弹出登录框
- 用户必须先登录才能使用应用

## 修改后
- 应用启动时不再自动弹出登录框
- 只在用户点击"添加订阅"或"导入 profile"时，如果未登录才弹出登录框
- 用户可以正常使用应用，只有在需要导入订阅时才需要登录

## 具体修改

### 1. 移除自动弹窗逻辑

#### `lib/pages/home.dart`
- 注释掉 `didChangeDependencies()` 方法中的 `_showLoginIfNeeded()` 调用
- 注释掉 `_showLoginIfNeeded()` 方法
- 移除登出后重新显示登录弹窗的逻辑
- 移除未使用的 `_dialogShown` 字段

#### `lib/application.dart`
- 注释掉 `initState()` 中的 `_checkXboardLogin()` 调用
- 注释掉 `_checkXboardLogin()` 方法
- 移除未使用的导入

### 2. 在配置界面添加登录检查

#### `lib/views/profiles/add_profile.dart`
- 将 `AddProfileView` 从 `StatelessWidget` 改为 `ConsumerWidget`
- 在 `_handleAddProfileFormFile()` 方法中添加登录状态检查
- 在 `_handleAddProfileFormURL()` 方法中添加登录状态检查
- 修改 `_toScan()` 和 `_toAdd()` 方法以传递 `WidgetRef`
- 更新 `build()` 方法以接收 `WidgetRef` 参数

### 3. 登录检查逻辑
```dart
// 检查登录状态
final authState = ref.read(xboardAuthProvider);
if (!authState.isLoggedIn) {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const XboardLoginDialog(),
  );
  // 如果登录失败或取消，则不继续
  if (!ref.read(xboardAuthProvider).isLoggedIn) {
    return;
  }
}
// 继续执行导入逻辑
```

## 影响的功能
- ✅ 应用启动：不再自动弹出登录框
- ✅ 主页：不再自动弹出登录框
- ✅ 添加文件 profile：未登录时弹出登录框
- ✅ 添加 URL profile：未登录时弹出登录框
- ✅ 扫描二维码：未登录时弹出登录框
- ✅ 登录成功后自动导入订阅：保持不变
- ✅ 登出功能：保持不变

## 用户体验改进
1. **更灵活的使用**：用户可以在不登录的情况下正常使用应用
2. **按需登录**：只有在需要导入订阅时才需要登录
3. **减少干扰**：不会在应用启动时强制用户登录
4. **保持功能**：登录后自动导入订阅的功能保持不变

## 测试建议
1. 启动应用，确认不会自动弹出登录框
2. 尝试添加 profile（文件/URL/二维码），确认未登录时会弹出登录框
3. 登录成功后，确认会自动导入订阅
4. 登出后，确认不会自动弹出登录框
5. 再次尝试添加 profile，确认会重新弹出登录框 