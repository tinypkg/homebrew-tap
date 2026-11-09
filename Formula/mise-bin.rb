class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.5/mise-v2026.11.5-macos-arm64"
      sha256 "4f9faebcfac7f8bb1321e697ba7a5ba26f645233aa269741a16482f757bd482e"

      def install
        bin.install "mise-v2026.11.5-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.5/mise-v2026.11.5-macos-x64"
      sha256 "f9489962f8c979520111b86b70c5da91086c54c9141edd116198d89093784a1e"

      def install
        bin.install "mise-v2026.11.5-macos-x64" => "mise"
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
