cask "trackpad-ges" do
  arch arm: "arm64"

  version "0.3.3"
  sha256 "61b29a9925c7bd6a0264d35dcd45834dd9644ec3c9585b8453094cda393eb560"

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
        ges init       # 自动跳系统设置授权 + 引导采集

    默认触发：按住 ⌥ Option + 画手势 + 松开
        （需要：辅助功能 + 输入监控 两项权限）

    不想授权键盘权限？切到 Force Click 模式（重压触控板触发）：
        ges trigger disable key
        ges trigger enable force_click

    查看 / 调整所有触发器：
        ges trigger list
  EOS
end
