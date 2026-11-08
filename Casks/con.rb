cask "con" do
  version "0.1.0-beta.175"

  on_arm do
    sha256 "576565c82236911768ec8fe5e99bd7b3ddc86f51840e1f464f68d8033e33522c"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-arm64.dmg"
  end

  on_intel do
    sha256 "5452a418b70a95945421b97754bbb05fa0c7d583727cac3fdd897de906ea642e"
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
