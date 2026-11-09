cask "capso" do
  version "1.2.8"
  sha256 "719ee84a8c0d9868171df9fc31675c3fdb9a556b183405c741f2d93fc83d5e58"

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
