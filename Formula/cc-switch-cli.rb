class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.6.0/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "3f722fdd661cbf5aebeb711ea267e397ed5e14aab9bf949acb9ba5e88253fbdc"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.6.0/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "fe27c18d6656db889b3fcd865bba1d5d6c993605059e93bfcb6884fd7a9a8e74"

      def install
        bin.install "cc-switch"
      end
    end
  end

  def post_install
    # Remove quarantine attribute from the binary
    chmod "+x", bin/"cc-switch"
    system_command "/usr/bin/xattr",
                   args: ["-cr", bin/"cc-switch"],
                   sudo: false
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
