class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.9.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.9.12/mise-v2026.9.12-macos-arm64"
      sha256 "f20d7cc555a5b0ee7b8a504acbc2583be1b0848d64115cfbe84119ceb705025b"

      def install
        bin.install "mise-v2026.9.12-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.9.12/mise-v2026.9.12-macos-x64"
      sha256 "fa1e35456f1e27a4555a1ccec82d5367d7037f3b4f46d48b83c4a3bceb4d78f2"

      def install
        bin.install "mise-v2026.9.12-macos-x64" => "mise"
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
