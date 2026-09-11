cask "cumora" do
  version "0.18.1"
  on_arm do
    sha256 "ebc5b78fe5b57c56def18e1964ee3d4f9f133598cb17ecddb57276ca72b0d3a2"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ae50243237b449ef4dde2ea26c3a4afc1cdcef506ac0e76be6c27ba50b8631a4"
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
