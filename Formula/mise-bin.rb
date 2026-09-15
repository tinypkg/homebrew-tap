class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.9.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.9.8/mise-v2026.9.8-macos-arm64"
      sha256 "02f8d2b54e7228e79217e5c14d76c09ba69212e07a934e80310e702134961c1d"

      def install
        bin.install "mise-v2026.9.8-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.9.8/mise-v2026.9.8-macos-x64"
      sha256 "7b0f853b033feccb5fae3ff0a96e7ea6c5c1bf52b4fcc6d9c1101036ab6a7c7f"

      def install
        bin.install "mise-v2026.9.8-macos-x64" => "mise"
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
