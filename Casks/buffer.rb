cask "buffer" do
  version "2.1.0"
  on_arm do
    sha256 "edb451c56b5b3bc7f54874b127308cbb5f88341e222208fad5b40f01053f6b37"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Silicon.dmg"
  end
  on_intel do
    sha256 "9037d7e79d166a60efac46f3b442dd88e9d568c0d4d03ee091f8d4e08b3144c3"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Intel.dmg"
  end

  name "Buffer"
  desc "Lightweight, beautiful clipboard manager for macOS"
  homepage "https://github.com/samirpatil2000/Buffer"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Buffer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Buffer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.samirpatil.buffer.plist",
    "~/Library/Caches/com.samirpatil.buffer",
    "~/Library/Application Support/Buffer",
  ]
end