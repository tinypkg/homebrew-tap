cask "codepilot" do
  version "0.65.0"

  on_arm do
    sha256 "1563ad80eaa6dd0c8b2a4895b49d9f82ecb6d5fec54c511f07a41ce0aeeb20f6"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "25c68012977e9075a2d8b20cd6ed046795ddffa4f28073ad9be3d4f85c643e44"

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
