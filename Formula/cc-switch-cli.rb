class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.3/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "380c5c987e62ab1a7ce83c4ca16e7abcc81c8d5c8fff91cf953b04701d692ce2"

      def install
        bin.install "cc-switch-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.3/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "7369b669e96fe97e1f0178df4f4eaebfdb576c1cf55c3c6d75c15eb6e19851d9"

      def install
        bin.install "cc-switch-cli"
      end
    end
  end

  def post_install
    # Remove quarantine attribute from the binary
    chmod "+x", bin/"cc-switch-cli"
    system_command "/usr/bin/xattr",
                   args: ["-cr", bin/"cc-switch-cli"],
                   sudo: false
  end

  def caveats
    <<~EOS
      cc-switch-cli has been installed!

      To get started, run:
        cc-switch-cli --help

      Learn more at: https://github.com/SaladDay/cc-switch-cli
    EOS
  end

  test do
    system "#{bin}/cc-switch-cli", "--version"
  end
end