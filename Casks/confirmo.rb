cask "confirmo" do
  version "1.0.92"

  on_arm do
    sha256 "83a1c47b43d365af83fbf97c8b2111ac7b9058f79c43e28872e56f112ec70a2d"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "54b34987b552f157e5b4ee7bf10e71fa1b511f7e64bcb1b9742179097ac65bf1"

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
