class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.11/mise-v2026.2.11-macos-arm64"
      sha256 "c1829d2ad128f21d232911514a5a6b98fa463c4d2239500bf376b5cd07ce0e8e"

      def install
        bin.install "mise-v2026.2.11-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.11/mise-v2026.2.11-macos-x64"
      sha256 "a4e4d6f4da459dc65fa2426de56a832fedac1e4f0b8304c1244b2395d7c15404"

      def install
        bin.install "mise-v2026.2.11-macos-x64" => "mise"
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
