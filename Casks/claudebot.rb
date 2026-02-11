cask "claudebot" do
  version "1.1.3"

  on_arm do
    sha256 "9f1a013393c7b70558503118cd06eafbc54bdf3cec7609d05d5f395cc9a2fe97"

    url "https://github.com/Philo-Li/claudebot/releases/download/v#{version}/ClaudeBot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "9e168c4676869a8a99df332d8733ac86868f0c25daa9b3c17985ef7ecb1e97e2"

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
