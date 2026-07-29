cask "puremac" do
  version "2.9.4"
  sha256 "1579cdec3c5eecb1176d360f7cb35b7fa10fde22e05f680fa16e46cdf2efb321"

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