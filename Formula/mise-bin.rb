class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.10/mise-v2026.11.10-macos-arm64"
      sha256 "3f4ba9d21c6f2170048d0870fd98ab287e04730b76a6fc8e83964d59c80eb704"

      def install
        bin.install "mise-v2026.11.10-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.10/mise-v2026.11.10-macos-x64"
      sha256 "7eab8054d301b75dcbd93440ff184bee6864d95799cfdc4a00ce858313b68783"

      def install
        bin.install "mise-v2026.11.10-macos-x64" => "mise"
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
