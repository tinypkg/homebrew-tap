cask "kooky" do
  version "0.37.2"
  sha256 "45b3cc3b841e73fdf4bdb7e33ca3dedbdce1217a8cafbf3199bb76c2144ee4d5"

  url "https://github.com/iAmCorey/kooky/releases/download/v#{version}/Kooky-v#{version}.dmg"
  name "Kooky"
  desc "专为 AI coding 优化的极简 macOS 终端"
  homepage "https://github.com/iAmCorey/kooky"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
