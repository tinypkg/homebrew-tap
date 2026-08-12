cask "puremac" do
  version "2.9.7"
  sha256 "e9a00594ecd3636fbbed7593fdd0b58acf7683f5a56131acf9345c995df7255b"

  url "https://github.com/momenbasel/PureMac/releases/download/v#{version}/PureMac-#{version}.zip"
  name "PureMac"
  desc "Free, open-source macOS app manager and system cleaner"
  homepage "https://github.com/momenbasel/PureMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PureMac.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/PureMac.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.puremac.app.plist",
    "~/Library/Caches/com.puremac.app",
    "~/Library/LaunchAgents/com.puremac.scheduler.plist",
  ]
end