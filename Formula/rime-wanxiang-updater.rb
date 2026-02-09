class RimeWanxiangUpdater < Formula
  desc "Rime Wanxiang dictionary updater"
  homepage "https://github.com/ca-x/rime-wanxiang-updater"
  version "0.6.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.13/rime-wanxiang-updater-darwin-arm64"
      sha256 "fa2b629c90bdfcc01f7478965e3690cdc2d485879d80c9baed4b85dc5c2f4e82"

      def install
        bin.install "rime-wanxiang-updater-darwin-arm64" => "rime-wanxiang-updater"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/rime-wanxiang-updater/releases/download/v0.6.13/rime-wanxiang-updater-darwin-amd64"
      sha256 "ad880b0e84fd02a6a875d28b0660d60610755d5bc286d3d18a75c82c09cb8153"

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
