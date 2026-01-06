# Homebrew Tap

这是 虫子樱桃私人维护的Homebrew Tap 仓库，提供个人喜好的一些软件的便捷macOS 应用安装方式。

## 使用方法

### 添加 Tap

```bash
brew tap tinypkg/tap
```

### 安装应用

```bash
# 安装 LazyCat 桌面客户端
brew install --cask lzc-client-desktop

# 更多应用即将添加...
```

### 卸载应用

```bash
brew uninstall --cask <应用名称>
```

### 卸载 Tap

如果要完全移除此 Tap：

```bash
# 先卸载所有通过此 Tap 安装的应用
brew uninstall --cask lzc-client-desktop

# 然后移除 Tap
brew untap tinypkg/tap
```

## 可用软件

| 软件名称 | 说明 | 安装命令 | 当前版本 |
|---------|------|---------|----------|
| lzc-client-desktop | 懒猫微服桌面客户端 | `brew install --cask lzc-client-desktop` | v1.6.7 |

## 特性

- 🍎 支持 Intel (x64) 和 Apple Silicon (arm64) 两种架构
- 🔒 所有软件包都经过 SHA256 校验和验证
- ⚡ 自动识别系统架构并下载对应版本
- 📦 遵循 Homebrew Cask 标准规范

## 开发者指南

### 添加新软件

1. 在 `Casks/` 目录下创建新的 `.rb` 文件
2. 按照 Homebrew Cask 规范编写配置
3. 提交 Pull Request

### 更新现有软件版本

当软件发布新版本时：

1. 更新对应 Cask 文件中的 `version` 字段
2. 下载新版本的安装包（Intel 和 Apple Silicon 版本）
3. 计算新的 SHA256 校验和：
   ```bash
   shasum -a 256 <软件包文件名>_x64.dmg
   shasum -a 256 <软件包文件名>_arm64.dmg
   ```
4. 更新 Cask 文件中对应的 `sha256` 值
5. 提交更新

### 本地测试

在发布前可以先在本地测试 Cask 配置：

```bash
# 测试安装
brew install --cask ./Casks/<cask-name>.rb

# 测试卸载
brew uninstall --cask <cask-name>

# Cask 语法检查
brew audit --cask <cask-name>
```

### Cask 多架构配置示例

```ruby
cask "example-app" do
  version "1.0.0"

  on_intel do
    sha256 "..."  # Intel 版本的 SHA256
    url "https://example.com/download/app_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "..."  # Apple Silicon 版本的 SHA256
    url "https://example.com/download/app_v#{version}_arm64.dmg"
  end

  name "Example App"
  desc "Example application description"
  homepage "https://example.com/"

  app "Example.app"
end
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

本仓库中的 Cask 配置文件遵循各软件自身的许可证。
