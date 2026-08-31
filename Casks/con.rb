cask "con" do
  version "0.1.0-beta.92"

  on_arm do
    sha256 "77b5e19fa1abb48291565abb41b02a89ca04434412dee89033c9180fa5818ca0"
    url "https://github.com/nowledge-co/con-terminal/releases/download/v#{version}/con-${ARM64_PREFIX}-#{version}-macos-arm64.dmg"
  end

  on_intel do
    sha256 "82a248e62662cc7c5f83fa3c4cf77fe6b628a63646de10935e465da3255d286a"
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
