cask "confirmo" do
  version "1.0.90"

  on_arm do
    sha256 "24934faa1c866c40f96c8e364a42f0920acb3c4e70e78915747c4c5cd5216a4a"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "743618f24df92246d45ec37dbdc89cecfb7184caaa0927f0a18abb0370555ac0"

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
