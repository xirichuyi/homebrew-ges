cask "trackpad-ges" do
  arch arm: "arm64"

  version "0.3.9"
  sha256 "7e31a172711ea95413da50b6c446f069647a210ca29acaebb1c0eec1d4348a55"

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
    第一次使用，直接敲：
        ges

    会自动进入引导：授权 → 取手势名 → 选动作 → 画 5 次 → 装后台服务。

    默认触发：按住 ⌥ Option + 画手势 + 松开 Option
    （需要：终端 App 在「辅助功能」+「输入监控」都勾上）

    其他触发方式：
        ges trigger list
  EOS
end
