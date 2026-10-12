cask "capso" do
  version "1.1.3"
  sha256 "a5a6b493fc1de1b897ffa9e0071cf849c115c4e1e0c516262c3d52d622b86d8a"

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
