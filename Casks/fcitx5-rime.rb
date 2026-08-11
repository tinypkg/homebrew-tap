cask "fcitx5-rime" do
  version "0.3.4"
  sha256 "8f764c0e34918ab8d9945f8fe7c674b701891ca4a69fae5577f4c79aba745da9"

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
