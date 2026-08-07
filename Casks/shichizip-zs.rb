cask "shichizip-zs" do
  version "0.3.1"

  on_arm do
    sha256 "3d9c9ea2072a834f4437b84127c1a59c46d4718eb13b3b16accead2c2d210ac5"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "39a83fac77a64a7b1cb20b69107b7c2bf667571d7f623b4e7c590259ca701506"
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