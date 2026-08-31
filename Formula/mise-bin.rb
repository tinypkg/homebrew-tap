class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.15/mise-v2026.8.15-macos-arm64"
      sha256 "17a6e37ac2aaeee78206abc601568e1fe5010e398bf3c7320e1683584124d3c7"

      def install
        bin.install "mise-v2026.8.15-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.15/mise-v2026.8.15-macos-x64"
      sha256 "6a1cef931e299d7392cd7008dd97fcef2d9b41fbdfe79df4fd9f7ab0cc33d9f7"

      def install
        bin.install "mise-v2026.8.15-macos-x64" => "mise"
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
