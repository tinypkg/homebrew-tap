class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.17/mise-v2026.2.17-macos-arm64"
      sha256 "ebb7dc5c52426a45dde75e76ba8bdf658aa0d2c9167850763c8f6eaf504a229a"

      def install
        bin.install "mise-v2026.2.17-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.17/mise-v2026.2.17-macos-x64"
      sha256 "ade538516eeb6e9b58f14008cbb0a45db8d4bdd8983a05dbfe34e17240cf26b0"

      def install
        bin.install "mise-v2026.2.17-macos-x64" => "mise"
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
