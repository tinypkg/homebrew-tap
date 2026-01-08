class RimeWanxiangUpdater < Formula
  desc "Rime Wanxiang dictionary updater"
  homepage "https://github.com/ca-x/rime-wanxiang-updater"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.5.9/rime-wanxiang-updater-darwin-arm64"
      sha256 "17480c9d59fd57103424e30dc17b9044bfad08651e41119de8580c556d333165"

      def install
        bin.install "rime-wanxiang-updater-darwin-arm64" => "rime-wanxiang-updater"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.5.9/rime-wanxiang-updater-darwin-amd64"
      sha256 "b4625131d3f1a9d2c6047519cefbf2c819c3ed18801439736e4a6f60648bdb60"

      def install
        bin.install "rime-wanxiang-updater-darwin-amd64" => "rime-wanxiang-updater"
      end
    end
  end

  def caveats
    <<~EOS
      rime-wanxiang-updater has been installed!
      Run 'rime-wanxiang-updater --help' to get started.
    EOS
  end

  test do
    system "#{bin}/rime-wanxiang-updater", "--version"
  end
end
