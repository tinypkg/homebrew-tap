cask "helmor" do
  version "0.31.0"

  on_arm do
    sha256 "ad2b73658e8321845a11bcc4284daf82c59ea3abbda9ee3e8d518bd3203c5dfd"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "f907c17316dff3d1c01a60bcf569065f7e87bdc05d5fbe5826da1050398b118c"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_x64.dmg"
  end

  name "Helmor"
  desc "An open-source local workbench for multi-agent software development. Built for orchestration, review, testing, merge, and everything around the code."
  homepage "https://helmor.ai"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Helmor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Helmor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.helmor.app.plist",
    "~/Library/Application Support/Helmor",
    "~/Library/Caches/Helmor",
    "~/Library/Saved Application State/com.helmor.app.savedState",
  ]
end