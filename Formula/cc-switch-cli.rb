class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.8.7/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "04a303da2b1bce33bbbe5bc0087ea2633f5c2d75ec48b06d2f373f980c905149"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.8.7/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "d3fab73f2b4768b92df195514ce567eef43fb3f9e2ac8540aa50922afb2a08da"

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
