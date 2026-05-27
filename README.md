# homebrew-ges

Homebrew tap for [trackpad-ges](https://github.com/xirichuyi/homebrew-ges) — macOS trackpad gesture recognition.

## Install

```bash
brew install --cask xirichuyi/ges/trackpad-ges
```

或者分两步（等价）：

```bash
brew tap xirichuyi/ges
brew install --cask trackpad-ges
```

## First run

```bash
ges init
```

会引导你完成权限授予和第一个手势采集。

## Permissions

需要给当前终端 App（Terminal / iTerm / Zed / VS Code 等，看你用哪个）授予：

- **辅助功能** (Accessibility) — 监听触发键
- **输入监控** (Input Monitoring) — macOS 14+ 必须

`系统设置 → 隐私与安全性`，勾上后**完全退出终端**（Cmd+Q）重开。

## Uninstall

```bash
brew uninstall --cask trackpad-ges
brew untap xirichuyi/ges
rm -rf ~/.ges    # 删除数据（如果你想彻底清干净）
```

## Supported

- macOS Sonoma (14) 或更新版本
- Apple Silicon (arm64) only
