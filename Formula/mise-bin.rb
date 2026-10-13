class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.9/mise-v2026.10.9-macos-arm64"
      sha256 "93a0703c25fc15cd4fbe02019c9ea23ca9045e077af5e96c01207e1346edb14a"

      def install
        bin.install "mise-v2026.10.9-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.9/mise-v2026.10.9-macos-x64"
      sha256 "8e243d9afcb73f3ee3ea35998e61f828cc0fc4a1cb0962defa702e54454bc1a7"

      def install
        bin.install "mise-v2026.10.9-macos-x64" => "mise"
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
