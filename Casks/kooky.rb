cask "kooky" do
  version "0.51.13"
  sha256 "6bf04f8a5c6ab80a50e8d8940e85e4b6cf0e466ad80266ade9fc9fb30a536020"

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
