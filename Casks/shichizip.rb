cask "shichizip" do
  version "0.3.1"

  on_arm do
    sha256 "ef81a388012daa58c8f59f7958c14d6c8ba585d7f387d4f38192436c644ea863"
    url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-v#{version}-arm64.zip"
  end

  on_intel do
    sha256 "5b461d806da8ec3d66656d9a21460cc55caf52fc90544a4d7bbca05ba654e008"
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