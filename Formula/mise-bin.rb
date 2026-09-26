class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.9.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.9.14/mise-v2026.9.14-macos-arm64"
      sha256 "04e7938f37506ce3a78d452b57d05c0590ad1c193d9ed2c937774a07c6b4c4f4"

      def install
        bin.install "mise-v2026.9.14-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.9.14/mise-v2026.9.14-macos-x64"
      sha256 "28f076fb4c388e6a4429f98261d5cf574090c383645a9fc5d8fccd6b6e9f2166"

      def install
        bin.install "mise-v2026.9.14-macos-x64" => "mise"
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
