class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.4.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.4.16/mise-v2026.4.16-macos-arm64"
      sha256 "9efbf3a7a8eda62e9ecb4533b4f394a817fffd5e8f1c8d924b1d0ccf5dde6a96"

      def install
        bin.install "mise-v2026.4.16-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.4.16/mise-v2026.4.16-macos-x64"
      sha256 "f7a15592ac180ca68c019b48614ca01a5ce8be261e7270b0074303802f1583ce"

      def install
        bin.install "mise-v2026.4.16-macos-x64" => "mise"
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
