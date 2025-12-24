# homebrew-tap

kevin197011 工具的 Homebrew tap 仓库。

## 安装

```bash
# 添加 tap 仓库
brew tap kevin197011/tap

# 更新仓库（获取最新版本）
brew update
```

**注意：** Homebrew 默认会在执行 `brew install` 或 `brew upgrade` 时自动更新 tap。如果遇到版本不是最新的情况，可以手动运行 `brew update` 来强制更新。

## 可用工具

### krun

系统配置和软件安装的 shell 脚本集合。

**安装：**
```bash
brew install kevin197011/tap/krun
```

**使用：**
```bash
krun status
```

**项目地址：** https://github.com/kevin197011/krun

### vagrant-manager

macOS 上的 Vagrant 虚拟机管理工具。

**安装：**
```bash
brew install --cask kevin197011/tap/vagrant-manager
```

**系统要求：**
- macOS 11.0 (Big Sur) 或更高版本
- Apple Silicon (M1/M2/M3/M4/M5) 或 Intel Mac
- 已安装 Vagrant 并在 PATH 中
- VirtualBox 或 Parallels（如使用这些提供商）

**项目地址：** https://github.com/kevin197011/vagrant-manager