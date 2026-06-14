class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.9/mise-v2026.6.9-macos-arm64"
      sha256 "e2beda809e62c757daea899bc3633d13f47693bd5fd64e381d108144b2a7a2de"

      def install
        bin.install "mise-v2026.6.9-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.9/mise-v2026.6.9-macos-x64"
      sha256 "e6f822c651fec5363d9b814f93a2813c2dfd06a5bec3212024aa92118918763c"

      def install
        bin.install "mise-v2026.6.9-macos-x64" => "mise"
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
