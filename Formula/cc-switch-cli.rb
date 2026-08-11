class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.10.1/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "dba2edb4d1b28292bfb62cb458cfbbe7fce26e20d9f8b13e9a1ad0f4b0c94549"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.10.1/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "1f743707c0204b1d8a4b2da1e90b3bbaba1ac032a9e1425a8174c18750cb9e1b"

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
