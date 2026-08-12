class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.5/mise-v2026.8.5-macos-arm64"
      sha256 "0268084c853545dc4a81acc0a494965a784a8935f3aa53728f0703398dc0cdbd"

      def install
        bin.install "mise-v2026.8.5-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.5/mise-v2026.8.5-macos-x64"
      sha256 "acb65a5dd836a45ee5214bfe6b881a2cf721f4ae587c5f108bbb868eaf6bebff"

      def install
        bin.install "mise-v2026.8.5-macos-x64" => "mise"
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
