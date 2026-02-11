cask "claudebot" do
  version "1.1.2"

  on_arm do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"

    url "https://github.com/Philo-Li/claudebot/releases/download/v#{version}/ClaudeBot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"

    url "https://github.com/Philo-Li/claudebot/releases/download/v#{version}/ClaudeBot-#{version}.dmg"
  end

  name "ClaudeBot"
  desc "Use claude code anywhere"
  homepage "https://github.com/Philo-Li/claudebot"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ClaudeBot.app"

  zap trash: [
    "~/Library/Application Support/ClaudeBot",
    "~/Library/Caches/ClaudeBot",
    "~/Library/Preferences/com.claudebot.app.plist",
    "~/Library/Saved Application State/com.claudebot.app.savedState",
  ]
end
