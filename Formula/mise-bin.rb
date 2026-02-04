class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.3/mise-v2026.2.3-macos-arm64"
      sha256 "6cdbab70a3a90c4e0741b8ccdf689580f122a45481e2b1d8e7ea563e07923e23"

      def install
        bin.install "mise-v2026.2.3-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.3/mise-v2026.2.3-macos-x64"
      sha256 "a3c023045657d4a9bf7c28baef645f2afc164b7aebef33a8649ceed0ba00ebdc"

      def install
        bin.install "mise-v2026.2.3-macos-x64" => "mise"
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
