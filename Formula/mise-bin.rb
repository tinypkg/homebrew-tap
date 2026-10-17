class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.12/mise-v2026.10.12-macos-arm64"
      sha256 "0cb03302051f844c9f9dddc4d53e3c5c9ea5fdd72ee1ca7fd3e3b1a55ac34ddf"

      def install
        bin.install "mise-v2026.10.12-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.12/mise-v2026.10.12-macos-x64"
      sha256 "471a885e775cf5022372d4c5c2f426228e8e1f48cdc4dca5cc718547cb390cab"

      def install
        bin.install "mise-v2026.10.12-macos-x64" => "mise"
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
