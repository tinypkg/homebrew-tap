cask "horseMD" do
  version "0.13.257"
  sha256 "8c5cbb99fff8c638dbb6ce1ca495de4d3cc7befb28735c9f1d7d2fc713cf2cf2"

  url "https://github.com/BND-1/horseMD/releases/download/v#{version}/HorseMD-#{version}-arm64.dmg"
  name "HorseMD"
  desc "Free Typora alternative with tabs, file tree and WYSIWYG Markdown editor"
  homepage "https://horsemd.yangsir.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "HorseMD.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/HorseMD.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/HorseMD",
    "~/Library/Caches/HorseMD",
    "~/Library/Preferences/com.bnd.horseMD.plist",
    "~/Library/Saved Application State/com.bnd.horseMD.savedState",
  ]
end
