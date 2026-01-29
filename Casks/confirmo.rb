cask "confirmo" do
  version "1.0.46"

  on_arm do
    sha256 "16a4420aca2cd8b84235ef78064a7dad20de8b3b701ab9d9a51ff407329d1804"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "7f7a5403e3b2f86d25aa256300f5eae6c5690f1110000e1b5b3a05ccc6662d3c"

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
