cask "recordly" do
  version "1.3.1"

  on_arm do
    sha256 "b311edcb43be19841b12aa3ca4b64569e2df9f7f8bd61eb2a2a344d870d2e51b"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "b4a9b9c61c16dc24f9f22a5eeb893f6a9f3440110207dcf57ac29aff218e9592"

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
