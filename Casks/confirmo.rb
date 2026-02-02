cask "confirmo" do
  version "1.0.70"

  on_arm do
    sha256 "b7996d5d98273cccd4c53f0ffaafc8f92db2a3131755c8e05ceb6ac771c3a7cd"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "85f854281115d5e5e8198b9f9a65873f9a90fcf6d3ed901706cc76602dcc43de"

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
