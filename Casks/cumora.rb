cask "cumora" do
  version "0.18.5"
  on_arm do
    sha256 "f94f55d0842154ac7d0d454856feb24dbeb1707c2dceb6c2e29a208c7f8ad1f5"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "31f74771dba2e16660bb070ecd4dafba1fbf6133b29bbc101b886c0cb91d90e2"
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
