cask "confirmo" do
  version "1.0.51"

  on_arm do
    sha256 "ba35df4acb00fdd9d12d3437ef94752ccaf4fc5abe50b9697ae2e0bb92ca7a48"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "e8fe4618286d529dfdbd0a33cccab482036ca405898691bdaa6f5b116a53cc9a"

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
