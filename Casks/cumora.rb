cask "cumora" do
  version "0.18.9"
  on_arm do
    sha256 "eaf35d4746d4a1f9e1df5ff12edf0e73cbce80c1f5702dff69483c3c99f6f7f7"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "80d7eb69003813d1624f86aa8eea7245114c76a8d2288772817cc9a1a6a1b0d5"
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
