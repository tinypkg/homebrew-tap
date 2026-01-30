cask "confirmo" do
  version "1.0.58"

  on_arm do
    sha256 "bd732b9bdb7ed52596bb50d241eeb35ba1f811c1e6ac7a21017e6f3559ac056d"

    url "https://updates.confirmo.love/confirmo-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "3444d6215c6335573b392efd02d2a28fa11aae0eabe83814fa1c20a83f80cf67"

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
