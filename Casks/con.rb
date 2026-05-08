cask "con" do
  version "0.1.0-beta.67"

  on_arm do
    sha256 "127473f0d28850698ded256b6bd85dd64054382b609a285d5d013767d383ffe6"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-arm64.dmg"
  end

  on_intel do
    sha256 "2327787f836d5cc8c5e350ba3462a1f7c6d9a3c73d430ffa191ab3b3f486cb5f"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-x86_64.dmg"
  end

  name "con"
  desc "The Native Terminal Emulator with a builtin AI Harness"
  homepage "https://con.nowledge.co/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "con Beta.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/con Beta.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/co.nowledge.con.beta",
    "~/Library/Caches/co.nowledge.con.beta",
    "~/Library/Preferences/co.nowledge.con.beta.plist",
    "~/Library/Saved Application State/co.nowledge.con.beta.savedState",
  ]
end