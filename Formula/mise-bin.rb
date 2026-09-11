class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.9.5/mise-v2026.9.5-macos-arm64"
      sha256 "6274b68122a837c514374e96dabb18a9e3562bdd28528b4b3feea9d8eb615d98"

      def install
        bin.install "mise-v2026.9.5-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.9.5/mise-v2026.9.5-macos-x64"
      sha256 "d60e503346188a6e3cbeb9c6a3dd55c1376869c8f19667604f7978e19a56f77c"

      def install
        bin.install "mise-v2026.9.5-macos-x64" => "mise"
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
