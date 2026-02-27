cask "fcitx5" do
  version "0.3.0"
  sha256 "a6721f22dda9d922898b0c17aaac8ac7faac9f4e645450fbec340353150e3949"

  url "https://github.com/fcitx-contrib/fcitx5-macos-installer/releases/download/#{version}/Fcitx5Installer.zip"
  name "Fcitx5"
  desc "Fcitx5 input method framework for macOS"
  homepage "https://github.com/fcitx-contrib/fcitx5-macos-installer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Fcitx5Installer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Fcitx5Installer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Fcitx5",
    "~/Library/Caches/org.fcitx.inputmethod.Fcitx5",
    "~/Library/Preferences/org.fcitx.inputmethod.Fcitx5.plist",
    "~/Library/Saved Application State/org.fcitx.inputmethod.Fcitx5.savedState",
  ]
end
