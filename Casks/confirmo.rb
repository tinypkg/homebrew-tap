cask "confirmo" do
  version "1.0.82"

  on_arm do
    sha256 "5c0409cec4093a05f9ec310e5b98aacb3ecc939ae4581e44f686ddf094bc41d8"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "4b950e4415ef2bf488d96fa7521d3e4d0c4c0ba5359ba6b30614403ac7b9f0a2"

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
