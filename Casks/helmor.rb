cask "helmor" do
  version "0.41.0"

  on_arm do
    sha256 "32e5336cee34db0ac7dbeb3fe12e7447883f1a88c9cb05bfaf70649a649e7721"
    url "https://github.com/dohooo/helmor/releases/download/v#{version}/Helmor_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "263b004f9d2dc53a1058869ebb3bdd9b018e0141cf1610f8e917457df0602e43"
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