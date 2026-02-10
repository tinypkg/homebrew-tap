cask "confirmo" do
  version "1.0.80"

  on_arm do
    sha256 "9bc32e9b4a6a9fe00b5a84ba26d80259fb8169db3d878553562a69c63477df84"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "1f3ba26daf1cc985ae8abe81bff7f0a8ac16d49c09f8b13b86db549bc18ff175"

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
