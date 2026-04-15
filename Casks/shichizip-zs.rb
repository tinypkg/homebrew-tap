cask "shichizip-zs" do
  version "0.0.2"

  on_arm do
    sha256 "PLACEHOLDER"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-Release-arm64.zip"
  end

  on_intel do
    sha256 "PLACEHOLDER"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-Release-x86_64.zip"
  end

  name "ShichiZip ZS"
  desc "The 7-Zip derivative with Zstandard compression for macOS"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ShichiZip ZS.app"

  # 清除 quarantine 属性，解决 macOS "已损坏" 问题
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ShichiZip ZS.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ShichiZip ZS",
    "~/Library/Caches/ShichiZip ZS",
    "~/Library/Preferences/com.idawnlight.ShichiZipZS.plist",
    "~/Library/Saved Application State/com.idawnlight.ShichiZipZS.savedState",
  ]
end