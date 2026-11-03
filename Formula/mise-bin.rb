class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.0/mise-v2026.11.0-macos-arm64"
      sha256 "0eee88353f31cf6f598084eb5fcd81191ae40e0a918ca449c45041d50ab81fcc"

      def install
        bin.install "mise-v2026.11.0-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.0/mise-v2026.11.0-macos-x64"
      sha256 "076bde3d03e925141c1a21981f0d635c7d9dacbae4fdd5cffdc27dcfaba4b0fb"

      def install
        bin.install "mise-v2026.11.0-macos-x64" => "mise"
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
