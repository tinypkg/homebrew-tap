cask "con" do
  version "0.1.0-beta.185"

  on_arm do
    sha256 "6bcb7a1b0d4efcf5ccda285579d0754789606c028753cdabd31755a7cbfeb4a7"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-arm64.dmg"
  end

  on_intel do
    sha256 "67f014b3ee0b27dfa1cbd64e94c475ddb281a0b56aa7bf40edb0136842eb609b"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-x86_64.dmg"
  end

  name "con"
  desc "The Native Terminal Emulator with a builtin AI Harness"
  homepage "https://con.nowledge.co/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

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
