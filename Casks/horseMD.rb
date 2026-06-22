cask "horseMD" do
  version "0.3.0"
  sha256 "131f5fbf5e31ee92963024cfce4fa7e9be28eff87795d90a12ce817f8e9317e7"

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
