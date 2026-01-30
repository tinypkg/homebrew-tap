cask "confirmo" do
  version "1.0.54"

  on_arm do
    sha256 "eb68811a58ca72fa2e57e494b9b45e208eaa2b6917ebcab8b9ade4df786d6d31"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "d7aa6d07ac72ed89a567afcf570ca5d98cf6bf91f6ef0599b51c7419e1050b1b"

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
