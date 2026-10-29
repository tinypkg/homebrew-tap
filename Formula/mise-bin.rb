class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.10.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.10.22/mise-v2026.10.22-macos-arm64"
      sha256 "8065ac0e64b5ba155945bf006b7e58d1fa35fc44d53a3576b1a8396f7209de8f"

      def install
        bin.install "mise-v2026.10.22-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.10.22/mise-v2026.10.22-macos-x64"
      sha256 "3995d45a4c45c5106921ea82fb3ae7312594f52a2355b0301ae8b3fed1a7f41b"

      def install
        bin.install "mise-v2026.10.22-macos-x64" => "mise"
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
