cask "shichizip-zs" do
  version "0.2.4"

  on_arm do
    sha256 "60385d3cdec54ffc32d6d76ad9fdd0d6a17041554eec4ae88867a7f24a846a1b"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "f94db7dc8b378b88fbb77b3b883277df7091d894b3a5db5e0e21d5bf63bc0a75"
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