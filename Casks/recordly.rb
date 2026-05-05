cask "recordly" do
  version "1.2.1"

  on_arm do
    sha256 "f9d1c5874ec009725a93338edce3fe511537ec0348113914b92577c01214d07b"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "aa89cf4fc6338dcb22eb6b1d2fc920a1cf6e5066742687463a426f1ac31bde84"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-x64.dmg"
  end

  name "Recordly"
  desc "Create polished screen recordings for free"
  homepage "https://github.com/webadderallorg/Recordly"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Recordly.app"

  zap trash: [
    "~/Library/Application Support/Recordly",
    "~/Library/Caches/Recordly",
    "~/Library/Preferences/com.webadderall.recordly.plist",
    "~/Library/Saved Application State/com.webadderall.recordly.savedState",
  ]
end
