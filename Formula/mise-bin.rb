class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.16/mise-v2026.8.16-macos-arm64"
      sha256 "59daf6d3d81846f5e190b3e8e30e06aaf003b48afd6619151bfd5df1829c75f4"

      def install
        bin.install "mise-v2026.8.16-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.16/mise-v2026.8.16-macos-x64"
      sha256 "746f53f878ae07be41caf4b73fd505e080c5618dda4794eac123e8ff086f472c"

      def install
        bin.install "mise-v2026.8.16-macos-x64" => "mise"
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
