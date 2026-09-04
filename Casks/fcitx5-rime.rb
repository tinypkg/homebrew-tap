cask "fcitx5-rime" do
  version "0.3.7"
  sha256 "61a9f4b334edfde15515bbef3b4e7c0965cb340e8f10906d159e2ccd699426ad"

  url "https://github.com/fcitx-contrib/fcitx5-macos-installer/releases/download/#{version}/Fcitx5-Rime.zip"
  name "Fcitx5 Rime"
  desc "Fcitx5 input method framework for macOS - Rime edition"
  homepage "https://github.com/fcitx-contrib/fcitx5-macos-installer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
