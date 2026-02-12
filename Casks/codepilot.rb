cask "codepilot" do
  version "0.10.1"

  on_arm do
    sha256 "b3bd7ac296c66701f4967b9080ef2c24410a8e3a1f335fe2e611df8fe71a7965"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ef61a44ec1854ba17c62cb9a17ccd1b2cd42d12b9b1a13031ab7d37df7f2da47"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
  end

  name "CodePilot"
  desc "A native desktop GUI for Claude Code"
  homepage "https://github.com/op7418/CodePilot"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CodePilot.app"

  zap trash: [
    "~/Library/Application Support/CodePilot",
    "~/Library/Caches/CodePilot",
    "~/Library/Preferences/com.codepilot.app.plist",
    "~/Library/Saved Application State/com.codepilot.app.savedState",
  ]
end
