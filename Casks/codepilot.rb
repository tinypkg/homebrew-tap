cask "codepilot" do
  version "0.68.0"

  on_arm do
    sha256 "922f7f897c29ba10c7fcdbc3f4769da886997226578e1f6d891aa22ded06749c"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "32c775fb97acfd5fa28f5681d8d74a4552bf89ae4f41e1dc25a95b8d62479c28"

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
