class RimeWanxiangUpdater < Formula
  desc "Rime Wanxiang dictionary updater"
  homepage "https://github.com/ca-x/rime-wanxiang-updater"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.3/rime-wanxiang-updater-darwin-arm64"
      sha256 "866e112663fc67febaac3cc8316a481d1b1e846ded474305f54fc489a7efc326"

      def install
        bin.install "rime-wanxiang-updater-darwin-arm64" => "rime-wanxiang-updater"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.3/rime-wanxiang-updater-darwin-amd64"
      sha256 "a07ae36f9c9cccc7b73632856728953804c216cfef0006a3adac3f0c56225891"

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
