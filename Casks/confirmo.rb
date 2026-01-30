cask "confirmo" do
  version "1.0.53"

  on_arm do
    sha256 "0950ed8458e4a47cb7d3c41d5d65240e40788b2cdc9a13241debd761eab66143"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "11b8ef2ae1a8e3a880c812937914fce94ade8463692fdf144f7a20d06b1eefa5"

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
