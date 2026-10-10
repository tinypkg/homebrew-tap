class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.7/mise-v2026.10.7-macos-arm64"
      sha256 "f5171e341518a57e8c4e9280e28443e35d66212c51164c83be76794e0a78b014"

      def install
        bin.install "mise-v2026.10.7-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.7/mise-v2026.10.7-macos-x64"
      sha256 "c3355f0c56d1b9fe73a2ba30e034b4e483541b25b1ad812a87440abfaeec8baa"

      def install
        bin.install "mise-v2026.10.7-macos-x64" => "mise"
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
