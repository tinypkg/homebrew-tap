cask "recordly" do
  version "1.4.0"

  on_arm do
    sha256 "520ee1d5570f2342e126306eda84b95e442c844b6f0e84c6e81c208445be8cc4"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "f478afef1c37adb8d4df9e0c0cdecde99df6f3131e34629ad3f5c3c8c226d1b5"

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
