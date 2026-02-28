class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.23/mise-v2026.2.23-macos-arm64"
      sha256 "c019b9fb5be696df49e2b158d3cc386fc24a8a3031c539f63b378531b98d8701"

      def install
        bin.install "mise-v2026.2.23-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.23/mise-v2026.2.23-macos-x64"
      sha256 "e790544733c6965f65cd0225d6bf76c6a91d2903b65bd79107d250315debbf11"

      def install
        bin.install "mise-v2026.2.23-macos-x64" => "mise"
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
