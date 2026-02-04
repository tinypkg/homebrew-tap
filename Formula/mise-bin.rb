class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.2/mise-v2026.2.2-macos-arm64"
      sha256 "d9c62e1b53612758d5f5083bddc7b52c32e01f4a6da92b4b5b578c53cd2f5c8f"

      def install
        bin.install "mise-v2026.2.2-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.2/mise-v2026.2.2-macos-x64"
      sha256 "51a8fdb6c790b6a1de0aa3ab709572d71a845754c69549dd7c7fbe1fc994bdc7"

      def install
        bin.install "mise-v2026.2.2-macos-x64" => "mise"
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
