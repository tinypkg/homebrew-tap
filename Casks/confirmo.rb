cask "confirmo" do
  version "1.0.88"

  on_arm do
    sha256 "909f0b30251a953d5b9d8695354716b25a84dd0218f2093cf374293a669e7e7e"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "9c2f6cf8cb9b5f795b170899a89fe47711934b8f1bb8ae5a46a8bac85ecd60e1"

    url "https://updates.confirmo.love/confirmo-#{version}-x64.dmg"
  end

  name "Confirmo"
  desc "Your AI coding companion that lives on your desktop"
  homepage "https://confirmo.love"

  livecheck do
    skip "No version information available"
  end

  app "Confirmo.app"

  zap trash: [
    "~/Library/Application Support/Confirmo",
    "~/Library/Preferences/com.confirmo.desktop.plist",
    "~/Library/Caches/com.confirmo.desktop",
    "~/Library/Saved Application State/com.confirmo.desktop.savedState",
  ]
end
