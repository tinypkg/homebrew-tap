class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.11/mise-v2026.11.11-macos-arm64"
      sha256 "09c2ad7631f8691454b66e24e645af9e48b27d7e7b320e5e12d2b98c392557e4"

      def install
        bin.install "mise-v2026.11.11-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.11/mise-v2026.11.11-macos-x64"
      sha256 "83fc4bdf61817e72beb4f664633c712c426539b79c9c59e6669e953a82783883"

      def install
        bin.install "mise-v2026.11.11-macos-x64" => "mise"
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
