class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.9.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.9.17/mise-v2026.9.17-macos-arm64"
      sha256 "b2dab031288ddd760878bfaefb1f403d2c5d99ca5c478a81c9e7baf07b5f7b84"

      def install
        bin.install "mise-v2026.9.17-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.9.17/mise-v2026.9.17-macos-x64"
      sha256 "5377f3173a8ba333612cfbaa3906b4a8cb167dfcca5bf2e76dc280243255abc3"

      def install
        bin.install "mise-v2026.9.17-macos-x64" => "mise"
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
