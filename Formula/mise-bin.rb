class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.0/mise-v2026.10.0-macos-arm64"
      sha256 "8d2007efdae0c2b64e3955257533e6ec17197bc2fdcbc5dd8f6847f92881deea"

      def install
        bin.install "mise-v2026.10.0-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.0/mise-v2026.10.0-macos-x64"
      sha256 "815eb7872e453dcd30ed5e2e478978d2947e34106b6cd4f9cc4d4e51f7761332"

      def install
        bin.install "mise-v2026.10.0-macos-x64" => "mise"
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
