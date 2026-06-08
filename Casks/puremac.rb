cask "puremac" do
  version "2.7.0"
  sha256 "bc6156d3263e11f1fcbb150e85d914d2983256977e5949fd4e4160a05b3f13d7"

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