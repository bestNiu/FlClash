# FlClash 二开分支变更记录

> 分支: `dev-custom`  
> 基于: `origin/main` (commit: `0e3cb99`)  
> 最后更新: 2026-01-02

## 📋 概述

本分支在原 FlClash 项目基础上，新增了 **Xboard 面板集成功能**，实现了用户登录、订阅同步等功能。

---

## 🔄 提交记录总览

| 序号 | Commit ID | 日期 | 作者 | 描述 |
|------|-----------|------|------|------|
| 1 | `54f6fc5` | 2025-12-31 | eric | chore: 更新 submodule URL 为 HTTPS 协议 |
| 2 | `3c292ac` | 2025-12-31 | eric | v1 - Xboard 模块初始版本 |
| 3 | `ef18e45` | 2025-12-31 | eric | feat(xboard): 优化高可用配置和缓存机制 |
| 4 | `df171be` | 2025-12-31 | eric | feat: 将导航栏 Xboard 改为 登录 |
| 5 | `9cfee5c` | 2025-12-31 | eric | feat: 隐藏登录页顶部标题，优化布局 |
| 6 | `80ff0c5` | 2026-01-02 | eric | 优化一些展示 |

---

## 📁 新增文件清单

### Xboard 模块 (`lib/xboard/`)

```
lib/xboard/
├── xboard.dart                              # 模块导出文件
├── models/
│   ├── xboard_models.dart                   # 数据模型定义
│   └── generated/
│       ├── xboard_models.freezed.dart       # Freezed 生成文件
│       └── xboard_models.g.dart             # JSON 序列化生成文件
├── providers/
│   ├── xboard_provider.dart                 # Riverpod 状态管理
│   └── generated/
│       └── xboard_provider.g.dart           # Provider 生成文件
├── services/
│   └── xboard_api.dart                      # API 服务层
└── views/
    ├── xboard_view.dart                     # 主视图
    └── xboard_login_view.dart               # 登录视图
```

---

## 📝 详细变更说明

### 1️⃣ Commit `54f6fc5` - 基础配置更新

**变更文件:**
- `.gitmodules` - 更新 submodule URL 为 HTTPS 协议
- `macos/Podfile.lock` - 更新依赖锁文件
- `pubspec.lock` - 更新依赖锁文件

**说明:** 基础配置调整，为后续开发做准备。

---

### 2️⃣ Commit `3c292ac` - Xboard 模块 v1 初始版本

**变更文件:**
- `lib/xboard/*` - 新增整个 Xboard 模块
- `lib/common/navigation.dart` - 添加 Xboard 导航项
- `lib/enum/enum.dart` - 添加 `PageLabel.login` 枚举
- `lib/models/config.dart` - 配置模型扩展
- `arb/intl_*.arb` - 国际化文件更新
- `build.yaml` - 构建配置更新

**核心功能:**
1. **数据模型** (`xboard_models.dart`)
   - `XboardConfig` - 面板配置
   - `XboardUser` - 用户信息
   - `XboardSubscription` - 订阅信息
   - `XboardLoginResponse` - 登录响应
   - `XboardUIConfig` - UI 配置（标题、欢迎语等）

2. **API 服务** (`xboard_api.dart`)
   - 用户登录/登出
   - 获取用户信息
   - 获取订阅信息
   - 高可用配置获取

3. **状态管理** (`xboard_provider.dart`)
   - 登录状态管理
   - 用户信息缓存
   - 订阅信息管理

4. **视图层**
   - `XboardView` - 主视图，展示用户信息和订阅
   - `XboardLoginView` - 登录页面

---

### 3️⃣ Commit `ef18e45` - 高可用配置和缓存优化

**变更文件:**
- `lib/xboard/models/xboard_models.dart`
- `lib/xboard/providers/xboard_provider.dart`
- `lib/xboard/services/xboard_api.dart`
- `lib/xboard/views/xboard_login_view.dart`
- `lib/xboard/views/xboard_view.dart`

**功能增强:**
- 默认面板地址设置为 `https://www.fly2025.com`
- 支持从 `config.yaml` 获取高可用配置（fly2026.com 和 fly2025.com）
- 支持自定义 UI 配置：标题、面板名称、欢迎语、底部提示文字、图标
- 实现基于 version 的配置更新机制
- 持久化 UI 配置，应用重启后立即可用
- 内存缓存有效期调整为 30 分钟
- 支持手动刷新配置

---

### 4️⃣ Commit `df171be` - 导航栏文案优化

**变更文件:**
- `arb/intl_en.arb` - 英文翻译
- `arb/intl_ja.arb` - 日文翻译
- `arb/intl_ru.arb` - 俄文翻译
- `arb/intl_zh_CN.arb` - 中文翻译
- `lib/common/navigation.dart`
- `lib/enum/enum.dart`

**变更内容:**
- 将导航栏 "Xboard" 改为 "登录"
- 更新所有语言的国际化翻译

---

### 5️⃣ Commit `9cfee5c` - 登录页布局优化

**变更文件:**
- `lib/xboard/views/xboard_login_view.dart`
- `lib/xboard/views/xboard_view.dart`

**变更内容:**
- 隐藏登录页顶部标题
- 优化登录页布局适配手机端

---

### 6️⃣ Commit `80ff0c5` - 展示优化

**变更文件:**
- `lib/xboard/views/xboard_login_view.dart`

**变更内容:**
- 优化一些展示细节

---

## 🔧 关键代码结构

### 导航集成 (`lib/common/navigation.dart`)

```dart
NavigationItem(
  icon: Icon(Icons.cloud_sync),
  label: PageLabel.login,
  builder: (_) => const XboardView(key: GlobalObjectKey(PageLabel.login)),
  modes: [NavigationItemMode.mobile, NavigationItemMode.desktop],
),
```

### 枚举扩展 (`lib/enum/enum.dart`)

```dart
enum PageLabel {
  dashboard,
  proxies,
  profiles,
  login,    // 新增
  tools,
  logs,
  requests,
  resources,
  connections,
}
```

---

## ⚠️ 合并主分支注意事项

### 可能冲突的文件

1. **`lib/enum/enum.dart`** - PageLabel 枚举可能有变化
2. **`lib/common/navigation.dart`** - 导航项结构可能有变化
3. **`arb/intl_*.arb`** - 国际化文件可能有新增条目
4. **`lib/models/config.dart`** - 配置模型可能有扩展
5. **`pubspec.lock` / `Podfile.lock`** - 依赖版本可能有更新

### 合并策略建议

1. **定期同步主分支**
   ```bash
   git fetch origin main
   git merge origin/main
   ```

2. **冲突处理优先级**
   - 枚举文件：保留双方新增内容
   - 导航文件：保留 Xboard 导航项，合并其他变更
   - 国际化文件：合并所有新增条目
   - 依赖文件：重新生成锁文件

3. **测试重点**
   - Xboard 登录功能是否正常
   - 导航切换是否正常
   - 国际化显示是否正确

---

## 📊 统计信息

- **新增文件**: 8 个
- **修改文件**: 16 个
- **新增代码行**: ~5000+ 行
- **主要模块**: Xboard 面板集成

---

## 🔗 分支关系

```
origin/main (0e3cb99)
    │
    ├── 54f6fc5 (chore: 更新 submodule URL)
    │
    ├── 3c292ac (v1 - Xboard 初始版本)
    │
    ├── ef18e45 (feat: 高可用配置和缓存)
    │
    ├── df171be (feat: 导航栏文案优化)
    │
    ├── 9cfee5c (feat: 登录页布局优化)
    │
    └── 80ff0c5 (优化展示) ← dev-custom HEAD
```

---

## 📅 后续计划

- [ ] 持续跟踪 origin/main 的更新
- [ ] 定期合并主分支变更
- [ ] 完善 Xboard 功能
- [ ] 添加单元测试

---

*文档生成时间: 2026-01-02*

