class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.2/mise-v2026.11.2-macos-arm64"
      sha256 "90684d13d9125cf207c45b19dbdbf19baf8d5d0e3e10109f236b1b4d027416c0"

      def install
        bin.install "mise-v2026.11.2-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.2/mise-v2026.11.2-macos-x64"
      sha256 "b7d12ef7ff9fd51870484b9e32fe873038b1f19bd5e45839196bc07ae73af72a"

      def install
        bin.install "mise-v2026.11.2-macos-x64" => "mise"
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
