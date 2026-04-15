cask "shichizip" do
  version "0.0.2"

  on_arm do
    sha256 "PLACEHOLDER"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-Release-arm64.zip"
  end

  on_intel do
    sha256 "PLACEHOLDER"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-Release-x86_64.zip"
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