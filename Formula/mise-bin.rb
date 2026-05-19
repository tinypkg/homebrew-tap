class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.12/mise-v2026.5.12-macos-arm64"
      sha256 "e777070540ffe22cf8b2b9f88aed88b461d0887d940c4f1c1a97359463cde6e1"

      def install
        bin.install "mise-v2026.5.12-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.12/mise-v2026.5.12-macos-x64"
      sha256 "de57e8dc82bbd880a69c9bc8aee06b9dcc578184b3e5cf86fcef80635d6a90b4"

      def install
        bin.install "mise-v2026.5.12-macos-x64" => "mise"
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
