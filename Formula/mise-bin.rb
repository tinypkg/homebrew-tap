class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.10/mise-v2026.10.10-macos-arm64"
      sha256 "f9ea45f740c0f96e564af0303fdc54d81230c36c8409de9084d14e1639e1d158"

      def install
        bin.install "mise-v2026.10.10-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.10/mise-v2026.10.10-macos-x64"
      sha256 "af3beb0cd292b2d35b38ed9c53fc4a901cd186a662daf4f3bc0da9bd062b667b"

      def install
        bin.install "mise-v2026.10.10-macos-x64" => "mise"
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
