class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.19/mise-v2026.2.19-macos-arm64"
      sha256 "48c1ba7d67900fe4eed86d4873d153753e04618e182c7e8de7f5dc2150c218aa"

      def install
        bin.install "mise-v2026.2.19-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.19/mise-v2026.2.19-macos-x64"
      sha256 "f86cd11617a1c335ca9bd11376bff2a6a02b6284360f5d0207a03632f6ae4270"

      def install
        bin.install "mise-v2026.2.19-macos-x64" => "mise"
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
