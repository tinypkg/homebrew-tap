cask "confirmo" do
  version "1.0.93"

  on_arm do
    sha256 "a7797d2907e3cffbbc65df0b0f5abff1b6f2ea7b85a26b3b25bb985bf690c6c2"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "b63b77d03ad28bdcfe48a0ee2a39aec142537caa4e473d5aea2c2bfc2fdfc3ed"

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
