cask "trackpad-ges" do
  arch arm: "arm64"

  version "0.2.0"
  sha256 "a41b7bc801ca4a63aa0747528b3d51d5d97dda7328e9daa968a4f4570ac5bdc1"

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

    操作方法（无需任何权限）：
      1. 单指放到触控板上保持不动 ~0.3 秒
      2. 听到 "叮" 一声进入录制
      3. 画手势
      4. 抬起手指
  EOS
end
