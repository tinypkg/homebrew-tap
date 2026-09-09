cask "cumora" do
  version "0.17.0"
  on_arm do
    sha256 "9de32d59d0b8cfe28a289c938ab8bc585bd85d16da3d601263cf1c490a331447"
    url "https://updates.cumora.ai/Cumora-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "e801dc643d5b074739267025d72953d6eca5f6078480a4d40fe79294e414ff55"
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
