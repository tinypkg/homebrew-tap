class CcSwitchCli < Formula
  desc "A cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
  homepage "https://github.com/SaladDay/cc-switch-cli"
  version "5.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.9.1/cc-switch-cli-darwin-arm64.tar.gz"
      sha256 "217ae316bcf554009e31f555f3eb29ba6b63290a2cd38064195210bcec4e2e85"

      def install
        bin.install "cc-switch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/SaladDay/cc-switch-cli/releases/download/v5.9.1/cc-switch-cli-darwin-x64.tar.gz"
      sha256 "42d56f2e1f4b5461ea57a7cb483e98f9b074ec7f1015e5332acc89e2ee9034d2"

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
