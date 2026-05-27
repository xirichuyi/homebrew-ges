# homebrew-ges

Homebrew tap for **trackpad-ges** — 在 macOS 触控板上画形状，触发任意 shell 命令。

## Install

```bash
brew install --cask xirichuyi/ges/trackpad-ges
```

或：

```bash
brew tap xirichuyi/ges
brew install --cask trackpad-ges
```

## Quick start

```bash
ges init
```

跟着引导走 3 步：取手势名 → 选触发动作 → 画 5 次手势。完成后默认装为后台服务，开机自启。

## How to use

不需要任何键盘快捷键或权限：

1. **单指**放到触控板上 → 保持不动 **~0.3 秒**
2. 听到 *"叮"* 一声 / 看到 🔴 → 进入录制模式
3. 画手势
4. 抬起手指 → 自动识别并执行

设计原因：
- 普通滑光标 → 立即移动，**不会**触发手势模式
- 多指（2-3 指）→ 系统手势（滚动 / Mission Control），**不会**触发
- 静止 0.3 秒 + 单指 = "我准备画手势了" 的明确意图

## All commands

```
ges init                              首次设置（3 步）
ges collect [--name NAME]             加采更多模板
ges list                              看所有手势 / 样本数 / 动作映射
ges set <手势> <命令>                  绑定动作
ges unset <手势>                      解绑
ges remove <手势>                     删除手势的样本
ges visualize [--template]            matplotlib 可视化
ges run                               前台跑识别（调试用）
ges service install                   装为后台服务（开机自启）
ges service uninstall                 卸载后台服务
ges service status                    后台服务状态
ges service logs                      看后台服务日志
```

## Data

存在 `~/.ges/`：

- `templates.json` — 手势样本（原始轨迹 + 预处理后的点）
- `settings.json` — 手势→动作映射
- `ges.log` — 后台服务日志

明文 JSON，手改 / 备份 / git 都行。

## Uninstall

```bash
ges service uninstall                 # 卸载后台服务
brew uninstall --cask trackpad-ges    # 卸载 binary
brew untap xirichuyi/ges
rm -rf ~/.ges                         # 删除数据（彻底清干净）
```

## Supported

- macOS Sonoma (14) 或更新版本
- Apple Silicon (arm64) only
