cask "shichizip-zs" do
  version "0.2.3"

  on_arm do
    sha256 "19de71a92c87714a6ab66200009c8ae1503ca923c6b8d9408da5f0af7d1e866a"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "e6c3369f3df366cf511d2682a9b4500b35bcc69a922f4dd1c13cc71136e48965"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-v#{version}-x86_64.zip"
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