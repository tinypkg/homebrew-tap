cask "cumora" do
  version "0.18.6"
  on_arm do
    sha256 "6c72d49439e5c5e1b47e39e0246de688d52db3d3ddd2c459971678dbfe24084f"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6c02be46fd25b98e9b16bd5d1ec46ceabc54cd28c0507a2f8943eeb5f3400bbb"
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
