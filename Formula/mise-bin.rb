class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.10/mise-v2026.8.10-macos-arm64"
      sha256 "a91ccafc1a90087c94c4c70bd61b455bfae087b899c1e5619f4ef515aa2e036f"

      def install
        bin.install "mise-v2026.8.10-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.10/mise-v2026.8.10-macos-x64"
      sha256 "37b1dabb65d96b266790fb8371ddc93884c004f796dbad8253c82712f80a4e08"

      def install
        bin.install "mise-v2026.8.10-macos-x64" => "mise"
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
