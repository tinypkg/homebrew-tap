class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.11/mise-v2026.5.11-macos-arm64"
      sha256 "1f404ecafe0a2ecc34bae661661b99e9cb06dba0f03f0e906ae4528b57d37e6c"

      def install
        bin.install "mise-v2026.5.11-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.11/mise-v2026.5.11-macos-x64"
      sha256 "0a2383b0ca7e3cea2e68796917506e79b74f06a1a64501c7f83e14f2520b43f0"

      def install
        bin.install "mise-v2026.5.11-macos-x64" => "mise"
      end
    end
  end

  def caveats
    <<~EOS
      mise has been installed!

      To get started, run:
        mise --version

      For shell integration, add to your shell profile:
        # For Bash
        echo 'eval "$(mise activate bash)"' >> ~/.bashrc

        # For Zsh
        echo 'eval "$(mise activate zsh)"' >> ~/.zshrc

        # For Fish
        echo 'mise activate fish | source' >> ~/.config/fish/config.fish

      Learn more at: https://mise.jdx.dev/
    EOS
  end

  test do
    system "#{bin}/mise", "--version"
  end
end
