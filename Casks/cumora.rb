cask "cumora" do
  version "0.4.0"
  on_arm do
    sha256 "23c15d7642b9625a10c239a08ac32392f87bf708c9261ea5e8e9cd385021655e"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f29164449a82d362aa7c21beeddac5dba89ffd3688e97fea8094c0081cc7d5ea"
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
