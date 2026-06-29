cask "horseMD" do
  version "0.3.1"
  sha256 "17890102fe1345c9d289535b754fe422c151d2fab33483b565d750c0ee633fc1"

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
