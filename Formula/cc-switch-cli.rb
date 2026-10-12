class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.11.1/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "6b9b10d3f260f221c8fe6cd691fa966a6facebca2c962a4302ec7f956dcf5e87"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.11.1/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "390e472800714fca4baac0ff2d437e48d07ceb473ca633e4a95a089538b43ae6"

      def install
        bin.install "cc-switch"
      end
    end
  end

  def post_install
    # Remove quarantine attribute from the binary
    chmod "+x", bin/"cc-switch"
    system "/usr/bin/xattr", "-cr", bin/"cc-switch"
  end

  def caveats
    <<~EOS
      cc-switch-cli has been installed!

      To get started, run:
        cc-switch --help

      Learn more at: https://github.com/SaladDay/cc-switch-cli
    EOS
  end

  test do
    system "#{bin}/cc-switch", "--version"
  end
end
