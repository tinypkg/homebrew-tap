cask "buffer" do
  version "2.5.0"
  on_arm do
    sha256 "2f33b7d09dfa7e73e2ffbea2ed8ac291efa9957c96a328f82aade691682da292"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Silicon.dmg"
  end
  on_intel do
    sha256 "3dbf06bf7b3471e663e7efdfcc1777def7522125c978a5fbd88b9380546064f3"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Intel.dmg"
  end

  name "Buffer"
  desc "Lightweight, beautiful clipboard manager for macOS"
  homepage "https://github.com/samirpatil2000/Buffer"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Buffer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Buffer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.samirpatil.buffer.plist",
    "~/Library/Caches/com.samirpatil.buffer",
    "~/Library/Application Support/Buffer",
  ]
end