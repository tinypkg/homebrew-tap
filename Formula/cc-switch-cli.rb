class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.1/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "f29ce2619f95b2b10f83b9cd7d0179edc333870f2acd6c93c0976c8a9013c18d"

      def install
        bin.install "cc-switch-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.1/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "e04fafdaffeb796466fb46d62ca3cfa2b5aec4049acd6343c3a2589041e8927a"

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