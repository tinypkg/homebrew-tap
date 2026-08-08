class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.3/mise-v2026.8.3-macos-arm64"
      sha256 "e2f25fc3a2fe82f15c33a2c7a2ec4cc0ed09eb9a1edc5cbcfe2f7f9902bfa4af"

      def install
        bin.install "mise-v2026.8.3-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.3/mise-v2026.8.3-macos-x64"
      sha256 "2bc0c80e8a7a33e545490dcfe73a73f20dfa964e62c237f296b34eff6c55a2d2"

      def install
        bin.install "mise-v2026.8.3-macos-x64" => "mise"
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
