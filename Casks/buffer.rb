cask "buffer" do
  version "2.6.0"
  on_arm do
    sha256 "c5c51b34b6712f4a2a40d618eea2bab84051c14cad13fc1cd5a9436e8b9edc1f"
    url "https://github.com/samirpatil2000/Buffer/releases/download/buffer-v#{version}/Buffer_Silicon.dmg"
  end
  on_intel do
    sha256 "990cf89f90c1d5b90f59f06cbc12e32797dc7f1ad0c0a3c92eb8d6cd1a713b63"
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