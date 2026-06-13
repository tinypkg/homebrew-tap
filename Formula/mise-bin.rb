class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.6/mise-v2026.6.6-macos-arm64"
      sha256 "82abeb5b3cdb377efa31ca83650bd4156d266980b6f2bc7fa4d09610330cc549"

      def install
        bin.install "mise-v2026.6.6-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.6/mise-v2026.6.6-macos-x64"
      sha256 "97fa76dc36b056c4c6e1f88f33e30187f9f1e387b98800eb985c1d0c7fa20084"

      def install
        bin.install "mise-v2026.6.6-macos-x64" => "mise"
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
