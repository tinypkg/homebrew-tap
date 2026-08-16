cask "shichizip" do
  version "0.3.2"

  on_arm do
    sha256 "b7511b42cac66bd5e9d4de0f6e345a391bf3229a34ff7ecc62bf11c27361132c"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "589260a85e96c5e601cea523d2cc9f548e0d83e925086704ce65a3ec7f5f4e1f"
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