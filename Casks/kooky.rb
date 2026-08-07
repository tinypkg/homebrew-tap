cask "kooky" do
  version "0.50.1"
  sha256 "78bdae5a1b022d7f43c94a0c87da06ea448c9a679f671b7e72389853b0144745"

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
