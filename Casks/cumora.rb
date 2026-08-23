cask "cumora" do
  version "0.2.0"
  on_arm do
    sha256 "790fa1b4c96fad07d4d2d65729d0280d683ce31e15ca698e9ee8aed2601efb32"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "8888c981c2b634b9f76bfeef3a9f8ba5d98fdc6f098f38a9b1366a7bcc2ca880"
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
