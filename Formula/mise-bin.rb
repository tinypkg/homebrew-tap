class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.25/mise-v2026.10.25-macos-arm64"
      sha256 "8a3ef00765b009278197aba627ac00d6e9c63f6aeb04d4f4b2cfe0e59ddc2fd6"

      def install
        bin.install "mise-v2026.10.25-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.25/mise-v2026.10.25-macos-x64"
      sha256 "e06eb3f0311dedbf65952ec2c0247398848653b302e6aad99d7371ad9ba33301"

      def install
        bin.install "mise-v2026.10.25-macos-x64" => "mise"
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
