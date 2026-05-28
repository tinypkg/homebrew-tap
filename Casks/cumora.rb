cask "cumora" do
  version "0.1.52"
  on_arm do
    sha256 "2d2d8bd1d419006c862495194247de5754caf9c38015686b8f3cfce46f0ec901"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1124ce44d5328038532d02a649e2b1056dffa204f32d325f19a3b7d3bf00b645"
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
