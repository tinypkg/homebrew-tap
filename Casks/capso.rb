cask "capso" do
  version "1.2.7"
  sha256 "0ba18bf3b9435cf45da7db8f72279efe246a02b006f33ccd036dd1b997d969f7"

  url "https://github.com/lzhgus/Capso/releases/download/v#{version}/Capso-#{version}.dmg"
  name "Capso"
  desc "Open-source screenshot and screen recording tool"
  homepage "https://github.com/lzhgus/Capso"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Capso.app"

  zap trash: "~/Library/Preferences/com.awesomemacapps.capso.plist"
end
