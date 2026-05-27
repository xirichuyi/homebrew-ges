cask "trackpad-ges" do
  arch arm: "arm64"

  version "1.0.0"
  sha256 "aeedcb00b13d48e904389ac3be2f05157578eb4b4edc2ebdc6f64035db678b14"

  url "https://github.com/xirichuyi/homebrew-ges/releases/download/v#{version}/TrackpadGes-#{version}-#{arch}.zip"
  name "TrackpadGes"
  desc "Trackpad gesture recognition for macOS"
  homepage "https://github.com/xirichuyi/homebrew-ges"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "TrackpadGes.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/TrackpadGes.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.ges",
    "~/Library/LaunchAgents/com.xirichuyi.trackpad-ges.plist",
  ]

  caveats <<~EOS
    第一次启动：在 Launchpad 找 TrackpadGes 双击，或：
        open -a TrackpadGes

    会出现在屏幕顶部菜单栏 (✋ 图标)。

    首次使用需要授权辅助功能（监听 ⌥ Option 键作为触发器）：
        系统设置 → 隐私与安全性 → 辅助功能 → 添加 TrackpadGes
  EOS
end
