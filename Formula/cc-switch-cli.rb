class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.0/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "bb8f238def27cdf71ee61f27a42ea83279ace4518c206846bb44e50a981ca728"

      def install
        bin.install "cc-switch-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.3.0/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "7e2cde3ebc4bb3d3da33e18d28184f06fca5b8cf46874e34617f1c57bcad036a"

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