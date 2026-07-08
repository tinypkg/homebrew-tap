cask "kooky" do
  version "0.32.0"
  sha256 "c7064909ccc3b0fb1cd63c05fb88f08e1823290f3fbd456dc3a9a4daf1990daf"

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
