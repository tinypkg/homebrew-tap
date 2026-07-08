class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.7.2/mise-v2026.7.2-macos-arm64"
      sha256 "695be7e1c33ffcbd090f3e8a5c481c7d62c4ddf66ff4ba9f0cad2cc2c6f786d1"

      def install
        bin.install "mise-v2026.7.2-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.7.2/mise-v2026.7.2-macos-x64"
      sha256 "42293f53d52561719c0c8c49dbea8be8e965dafaf403fd3fd40b753001948455"

      def install
        bin.install "mise-v2026.7.2-macos-x64" => "mise"
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
