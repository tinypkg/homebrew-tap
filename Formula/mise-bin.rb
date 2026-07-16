class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.7.7/mise-v2026.7.7-macos-arm64"
      sha256 "5b890cccc75fc43a494b83ace21dbd2ee26120ff19ba1994cdcd054b3a15abbd"

      def install
        bin.install "mise-v2026.7.7-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.7.7/mise-v2026.7.7-macos-x64"
      sha256 "7b860e6495eea9a264a16dae575ac20d5618ea2fe97905756c661eb02035c5d9"

      def install
        bin.install "mise-v2026.7.7-macos-x64" => "mise"
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
