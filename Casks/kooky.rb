cask "kooky" do
  version "0.51.9"
  sha256 "ff87ee4c7a99154ad6e919374d87bf73d405601f50eba7221a795ac021b887e2"

  url "https://github.com/iAmCorey/kooky/releases/download/v#{version}/Kooky-v#{version}.dmg"
  name "Kooky"
  desc "专为 AI coding 优化的极简 macOS 终端"
  homepage "https://github.com/iAmCorey/kooky"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Kooky.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Kooky.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Kooky",
    "~/Library/Caches/Kooky",
    "~/Library/Preferences/com.kooky.plist",
  ]
end
