class RimeWanxiangUpdater < Formula
  desc "Rime Wanxiang dictionary updater"
  homepage "https://github.com/ca-x/rime-wanxiang-updater"
  version "0.6.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.14/rime-wanxiang-updater-darwin-arm64"
      sha256 "475e2da67486c57d0ad9932d610c7c404840b757bfbae675a7bcb5e51af595c6"

      def install
        bin.install "rime-wanxiang-updater-darwin-arm64" => "rime-wanxiang-updater"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.14/rime-wanxiang-updater-darwin-amd64"
      sha256 "cf8d8ec861583e39dcec9a59e9bb1586e42e1efca0753e5bdc3c25754d445e4a"

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
