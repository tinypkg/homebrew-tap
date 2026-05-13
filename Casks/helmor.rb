cask "helmor" do
  version "0.21.2"

  on_arm do
    sha256 "48ff1bc941a6a44d0b1d6ad00bf4d277ab79779fda21a4be911a216c09f164f7"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "41cf67413ad3b0a7975709410b368ef25133d16e790dc381ce74c481cff0ec1b"
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