class RimeWanxiangUpdater < Formula
  desc "Rime Wanxiang dictionary updater"
  homepage "https://github.com/ca-x/rime-wanxiang-updater"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.5.8/rime-wanxiang-updater-darwin-arm64"
      sha256 "2fd7cc95071865313e74ecbbcefddb4d76b9e1b6376fee38e81328c46407229c"

      def install
        bin.install "rime-wanxiang-updater-darwin-arm64" => "rime-wanxiang-updater"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.5.8/rime-wanxiang-updater-darwin-amd64"
      sha256 "900bf614bdecbc9c67e12c560a283244079a10891f8bf777ec7373c91508b74e"

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
