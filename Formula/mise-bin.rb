class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.12/mise-v2026.6.12-macos-arm64"
      sha256 "8583aff874ccb08dcc24d857bcaccb6a9c3f547a2563cfa02ae85127653ee35e"

      def install
        bin.install "mise-v2026.6.12-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.12/mise-v2026.6.12-macos-x64"
      sha256 "06b6b7c8d85b30cfcb11bf4d0a56bc5419bee73e5fa774bca75c5835abc82cb2"

      def install
        bin.install "mise-v2026.6.12-macos-x64" => "mise"
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
