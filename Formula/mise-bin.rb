class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.1/mise-v2026.6.1-macos-arm64"
      sha256 "ac95cf406b8c350dd7e7ac074a9b64c1802c052fa9337820ec18e4b5acc405f7"

      def install
        bin.install "mise-v2026.6.1-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.1/mise-v2026.6.1-macos-x64"
      sha256 "5a5bd62cc27c15c029a77724e2a6949e2f2bfc73b0ac1946d8afed79132b6aa5"

      def install
        bin.install "mise-v2026.6.1-macos-x64" => "mise"
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
