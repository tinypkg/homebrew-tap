class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.8/mise-v2026.5.8-macos-arm64"
      sha256 "e46556b32f6d2e0aebe97028bbe2c4067ea65d5b8ed456a8c4f5c48d141079e3"

      def install
        bin.install "mise-v2026.5.8-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.8/mise-v2026.5.8-macos-x64"
      sha256 "034531fb91fef1739b5312d00e1dda7735352721f4e3f18a80401059cc2eb2dd"

      def install
        bin.install "mise-v2026.5.8-macos-x64" => "mise"
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
