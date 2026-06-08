cask "helmor" do
  version "0.32.0"

  on_arm do
    sha256 "68139b221b08f0564b19e09e5e3654225070491340d24994ecc99e0877f75022"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "00d80e1a0f77da6435a0757a43b445ec0f754b535f298c909a58d457518eb0d9"
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