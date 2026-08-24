class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.12/mise-v2026.8.12-macos-arm64"
      sha256 "9298858399b093ad9e57bc4c20eaad900b1cedb32991e0d2486bc5d34baca61d"

      def install
        bin.install "mise-v2026.8.12-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.12/mise-v2026.8.12-macos-x64"
      sha256 "ceee0577678b296421611f9ca5adecb828ded425a9d4b0419ee63f9cc645ba50"

      def install
        bin.install "mise-v2026.8.12-macos-x64" => "mise"
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
