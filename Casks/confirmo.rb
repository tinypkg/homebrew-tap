cask "confirmo" do
  version "1.0.96"

  on_arm do
    sha256 "03239cd21238de2ac706752103d2f776eecaecfa374b4dc4f90746f3e9d1a59f"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "c8e22a5066d6052cd98ba7276ce1dccd9ef955711a644024606d83b13408f1da"

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
