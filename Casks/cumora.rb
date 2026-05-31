cask "cumora" do
  version "0.1.61"
  on_arm do
    sha256 "22686c359b9b079c8ce9ce5159acbee2a16013e323f4d738cede573a254b316b"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f2784809c0ae235561f25d9bd6370e48470afc550fcb9625be4e332c86475c43"
    url "https://updates.cumora.ai/Cumora-#{version}.dmg"
  end

  name "Cumora"
  desc "A workspace where AI teammates live, not visit"
  homepage "https://cumora.ai"

  livecheck do
    url "https://updates.cumora.ai/latest.yml"
    strategy :yaml
  end

  app "Cumora.app"

  zap trash: [
    "~/Library/Application Support/Cumora",
    "~/Library/Preferences/com.cumora.app.plist",
    "~/Library/Caches/Cumora",
    "~/Library/Saved Application State/com.cumora.app.savedState",
  ]
end
