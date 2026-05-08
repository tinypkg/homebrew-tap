cask "helmor" do
  version "0.20.1"

  on_arm do
    sha256 "5021f04fc970a86e1d7b1276bc931f23be3ce216945d83de6f7da384c49a6762"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "da3ac8d1e0972bd201ae2bce6532d81fbf1487ef0ba8620eafc55f9d29c78dd6"
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