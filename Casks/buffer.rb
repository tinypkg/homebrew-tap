cask "buffer" do
  version "2.3.0"
  on_arm do
    sha256 "56d56d8a55487e8a5ce8f4d2c32b3d95a3bf2f7fba6e95d5be9854e3bf67da95"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Silicon.dmg"
  end
  on_intel do
    sha256 "827d49f5a43a9f5a2de425c24262c11a416d94d8ea0999c82084a95b05d47b4f"
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