cask "winmux" do
  version "0.2.1"
  sha256 "fc4841cc689d488439eed4effd003b540308bfbd54321a5c2cbce2b6b2b67497"

  url "https://github.com/ZimengXiong/winmux/releases/download/v#{version}/WinMux-#{version}.zip"
  name "WinMux"
  desc "A intuitive, batteries-included WM for macOS built on Aerospace"
  homepage "https://github.com/ZimengXiong/winmux"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "WinMux.app"

  # 清除 quarantine 属性，解决 macOS "已损坏" 问题
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/WinMux.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/WinMux",
    "~/Library/Preferences/com.zimengxiong.winmux.plist",
    "~/Library/Caches/WinMux",
  ]
end