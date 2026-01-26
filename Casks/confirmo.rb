cask "confirmo" do
  version "1.0.20"

  on_arm do
    sha256 "a6dc21e98e1fbd2000a94f063886fdfccdb21dbf5108f3a2c0a1e8cf7b8f3c74"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "0214b7bd194ca8485de42b41dfec4222141006a51ef34e0d86cc9cb6aef0fa89"

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
