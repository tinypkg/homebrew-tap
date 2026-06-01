cask "shichizip" do
  version "0.2.4"

  on_arm do
    sha256 "be34dafd2b0d39288ea90a90f44d8a0a39b74460952ca275401d44ae2faed8a9"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "9419e32bbfb4bb050ead72624396ee6513e43db623eef38a91c8b2303c70c73e"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-v#{version}-x86_64.zip"
  end

  name "ShichiZip"
  desc "The 7-Zip derivative intended for macOS"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ShichiZip.app"

  # 清除 quarantine 属性，解决 macOS "已损坏" 问题
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ShichiZip.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ShichiZip",
    "~/Library/Caches/ShichiZip",
    "~/Library/Preferences/com.idawnlight.ShichiZip.plist",
    "~/Library/Saved Application State/com.idawnlight.ShichiZip.savedState",
  ]
end