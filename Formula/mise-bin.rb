class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.9/mise-v2026.5.9-macos-arm64"
      sha256 "e07a7beb01bdc2387cf8bc54a27f497f8ab71845e5bf063d709f1423959c7ccb"

      def install
        bin.install "mise-v2026.5.9-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.9/mise-v2026.5.9-macos-x64"
      sha256 "44f11d01b32d4f20b5d21bb00e279041bb8c3d3b3c1be90ed08f65ffa9754634"

      def install
        bin.install "mise-v2026.5.9-macos-x64" => "mise"
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
