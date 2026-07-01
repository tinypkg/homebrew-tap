cask "codepilot" do
  version "0.56.3"

  on_arm do
    sha256 "5c4ffef9237884786c3a3f9b9bf3f7a3d78f6da7c62c4900e6c215039f5ac964"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "33e32a1e24a9c59d71ea2a64a0b2ecabc21cbacd24ae5f3b03782513000b6118"

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
