cask "snapzy" do
  version "1.29.1"
  sha256 "d761801001fe579144f4866f9413ba32c75d1a5dc94011f9b84ced1824f5a88c"

  url "https://github.com/duongductrong/Snapzy/releases/download/v#{version}/Snapzy-v#{version}.dmg"
  name "Snapzy"
  desc "Native macOS screenshots, recording, annotation, and editing from the menu bar"
  homepage "https://github.com/duongductrong/Snapzy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Snapzy.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Snapzy.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Snapzy",
    "~/Library/Preferences/Snapzy.plist",
    "~/Library/Caches/Snapzy",
  ]
end