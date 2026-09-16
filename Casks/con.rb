cask "con" do
  version "0.1.0-beta.98"

  on_arm do
    sha256 "e4387ecbd0f40e0fb8d86533e9e6711eca4a2f255633dba27f5d2e13cff73721"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-arm64.dmg"
  end

  on_intel do
    sha256 "1672b422b4d8a60912c928267826668dbb0c3d50fdc9d6eb24a8301a8ab5c5d5"
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
