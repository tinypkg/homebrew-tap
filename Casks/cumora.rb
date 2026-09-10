cask "cumora" do
  version "0.18.0"
  on_arm do
    sha256 "b45aa8149f54829a7d2ab31b088853bd8fc8045ea635ff21acea055bab2ebe54"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "68446ac0869b56a55e8f96e0d2464f82d0af4ef60a7e9a5fb125023f28148d4a"
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
