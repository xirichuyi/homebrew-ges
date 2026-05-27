cask "trackpad-ges" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 "77a3af9f6f339105692de1e2d1cb629c9cb8e61e1dba0bd9d42ca16f662232fc"

  url "https://github.com/xirichuyi/homebrew-ges/releases/download/v#{version}/trackpad-ges-#{version}-#{arch}.tar.gz"
  name "trackpad-ges"
  desc "Trackpad gesture recognition for macOS — draw a shape, run a command"
  homepage "https://github.com/xirichuyi/homebrew-ges"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  binary "ges"

  postflight do
    # PyInstaller 产物未签名，brew 下载后默认有 com.apple.quarantine，
    # Gatekeeper 会直接 kill 进程。手动移除属性。
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/ges"],
                   must_succeed: false
  end

  caveats <<~EOS
    首次运行：
        ges init

    需要给当前终端 App 授权（系统设置 → 隐私与安全性）：
      · 辅助功能
      · 输入监控

    授权完成后，完全退出终端（Cmd+Q）重新打开。
  EOS
end
