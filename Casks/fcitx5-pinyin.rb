cask "fcitx5-pinyin" do
  version "0.3.0"
  sha256 "32f58dfa0d9fdb6fb1c9283396c3a5be204b30d364da4e682e20b54a656e7563"

  url "https://github.com/fcitx-contrib/fcitx5-macos-installer/releases/download/#{version}/Fcitx5-Pinyin.zip"
  name "Fcitx5 Pinyin"
  desc "Fcitx5 input method framework for macOS - Pinyin edition"
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
