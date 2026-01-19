cask "noi" do
  version "1.1.0"

  on_arm do
    sha256 "08583cba4bdc3308b49f393ef272f844690262ad3eb7ab6c9399a859ccbddfd2"

    url "https://github.com/lencx/Noi/releases/download/v#{version}/Noi-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "47275c8944f2da7070f85f1bc9b356a93447b2c66a30a361023465110a907d43"

    url "https://github.com/lencx/Noi/releases/download/v#{version}/Noi-#{version}-x64.dmg"
  end

  name "Noi"
  desc "Less chaos. More flow"
  homepage "https://github.com/lencx/Noi"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Noi.app"

  zap trash: [
    "~/Library/Application Support/com.noi.app",
    "~/Library/Caches/com.noi.app",
    "~/Library/Preferences/com.noi.app.plist",
    "~/Library/Saved Application State/com.noi.app.savedState",
  ]
end
