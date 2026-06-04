class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.0/mise-v2026.6.0-macos-arm64"
      sha256 "ad62b2b86c56f986b5a687cbefd5069338aa89aec9f8997a9bafe183e708c1ca"

      def install
        bin.install "mise-v2026.6.0-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.0/mise-v2026.6.0-macos-x64"
      sha256 "c9015b5cda8d75ebbdb8367d330b52a3189e85bbb42b2a29c9ce1cd1e8463947"

      def install
        bin.install "mise-v2026.6.0-macos-x64" => "mise"
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
