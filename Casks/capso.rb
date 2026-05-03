cask "capso" do
  version "0.7.0"
  sha256 "afe81c9484d76ca2cba61c66cd773f21f135bab23999b31408a5ce84269700c5"

  url "https://github.com/lzhgus/Capso/releases/download/v#{version}/Capso-#{version}.dmg"
  name "Capso"
  desc "Open-source screenshot and screen recording tool"
  homepage "https://github.com/lzhgus/Capso"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Capso.app"

  zap trash: "~/Library/Preferences/com.awesomemacapps.capso.plist"
end
