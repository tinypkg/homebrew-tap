class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.13/mise-v2026.5.13-macos-arm64"
      sha256 "97e0052cc0bb9ce80a22b020e8eda079200745e29b8e488a45bb1a190067e075"

      def install
        bin.install "mise-v2026.5.13-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.13/mise-v2026.5.13-macos-x64"
      sha256 "bbb80876eb1b1ce439e84a3163a97c73241f54ff1bc462e9e0c51c6d929e8f4f"

      def install
        bin.install "mise-v2026.5.13-macos-x64" => "mise"
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
