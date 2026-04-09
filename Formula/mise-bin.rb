class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.4.7/mise-v2026.4.7-macos-arm64"
      sha256 "d82de9d195dd63598dde62664fb0cf835746ab753dfc66de934ad4c62634cada"

      def install
        bin.install "mise-v2026.4.7-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.4.7/mise-v2026.4.7-macos-x64"
      sha256 "e8f42e7649f5192ced02f4a30e47fe5cb588cb45c1be30a7aaa7d1a3cadda2cd"

      def install
        bin.install "mise-v2026.4.7-macos-x64" => "mise"
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
