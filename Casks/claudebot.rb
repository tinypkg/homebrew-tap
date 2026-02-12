cask "claudebot" do
  version "1.1.4"

  on_arm do
    sha256 "ca0ea6be0b24c785cd6cd1e7d847749328b3f3de84dfb889608c9ae7b0ba5139"

    url "https://github.com/Philo-Li/claudebot/releases/download/v#{version}/ClaudeBot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "dd85e6799bedf19023e19c63e48183f7544488b84d6fca4fed4d1d0f55c7b141"

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
