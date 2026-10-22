class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.11.3/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "2b74bc7edef596e909b8caf17dac8076c0cf96e381eec9a423cea244e1018121"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.11.3/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "f7cdd3ea0392610526efb9f4a6765e482424bc07bcfd6c3254c67973758be40d"

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
