cask "winmux" do
  version "0.5.4"
  sha256 "d4ab708c391ac4b045396c4f9585d4c5dfaabe5d340c62e55bb3f3462a98b05b"

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