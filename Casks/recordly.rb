cask "recordly" do
  version "1.3.0"

  on_arm do
    sha256 "6e9929074e22bd79394ea5b83bc7a3ef4cdf0c0828bafdcb004ff329c1628416"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "0241682ad2d1269e31f659c4fd9c1d64b9fc4095153944b8d30a8ffef5968dd2"

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
