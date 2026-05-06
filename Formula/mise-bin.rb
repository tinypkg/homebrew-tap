class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.1/mise-v2026.5.1-macos-arm64"
      sha256 "99800e7d20df5dae939a943ca9673a57d248ccb1ee4ebd5e4f1f8bd91b9e26bf"

      def install
        bin.install "mise-v2026.5.1-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.1/mise-v2026.5.1-macos-x64"
      sha256 "283b5f80ad9b4f744b800a90a147f7e12f25b960f690bb1b2aeb4b443fcb2bc1"

      def install
        bin.install "mise-v2026.5.1-macos-x64" => "mise"
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
