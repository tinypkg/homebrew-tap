class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.18/mise-v2026.10.18-macos-arm64"
      sha256 "d40e2fcd96fed7c70b04af282c36534d87d0318bef89c16fa00c9f98e55ade88"

      def install
        bin.install "mise-v2026.10.18-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.18/mise-v2026.10.18-macos-x64"
      sha256 "72e1ced3bac89d0e0aa28b04bd22f8941c111d3b20c74a77bfb6a9486f25f7d3"

      def install
        bin.install "mise-v2026.10.18-macos-x64" => "mise"
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
