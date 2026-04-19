cask "claudebot" do
  version "1.1.6"

  on_arm do
    sha256 "a9e059473ec24210a9097b6539467ef3a92aadf2ea68b6b9f73aab15a22355b4"

    url "https://github.com/Philo-Li/claudebot/releases/download/v#{version}/ClaudeBot-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "760002e581d93ef6248ba39edc846d051e8ead21f98640186e12ddbde300c11e"

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
