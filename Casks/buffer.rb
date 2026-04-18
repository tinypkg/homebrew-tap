cask "buffer" do
  version "1.7"
  on_arm do
    sha256 "c368ba885891a78c05f099f059444d1b2b9a023be881701dd668a59ea5032599"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Silicon.dmg"
  end
  on_intel do
    sha256 "6ed54273a483b8c08fb8a01b633f9efae563a10fb4239f0d1b4c96f9e11ee482"
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