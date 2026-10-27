class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.21/mise-v2026.10.21-macos-arm64"
      sha256 "b20d30788a819fade398a1cb92aee56c383e3c34324162ec39fb8567dee79ba6"

      def install
        bin.install "mise-v2026.10.21-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.21/mise-v2026.10.21-macos-x64"
      sha256 "5dde6e3fcda4d8a68b95cc2180dacd58e7b940f86e4579991e13540a5d009055"

      def install
        bin.install "mise-v2026.10.21-macos-x64" => "mise"
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
