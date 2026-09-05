cask "cumora" do
  version "0.15.0"
  on_arm do
    sha256 "ad4fd0ce1cd20d8a4be628b8f74ca6c9b7a4f0e35837a64969a8d668eb2cf25d"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "58a4a2700772e00b2e7a637c0d01bbe995699bff2a2bbb503196da139eb279dc"
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
