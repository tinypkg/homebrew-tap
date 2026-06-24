class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.13/mise-v2026.6.13-macos-arm64"
      sha256 "ef22ecc1e9c6cfee5107cd7982edbb8dbaca95600d9a9090ca8e4c4c37aaa6b8"

      def install
        bin.install "mise-v2026.6.13-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.13/mise-v2026.6.13-macos-x64"
      sha256 "e61eaff8ce16f5ce7df399a8516361f43d2e21625b3e144c6e9f95474c0c99b3"

      def install
        bin.install "mise-v2026.6.13-macos-x64" => "mise"
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
