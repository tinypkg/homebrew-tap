class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.16/mise-v2026.5.16-macos-arm64"
      sha256 "952118ce892730c5a1ba27166d2ce93ecdd6a12e823f7b4fe78ae27da452b950"

      def install
        bin.install "mise-v2026.5.16-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.16/mise-v2026.5.16-macos-x64"
      sha256 "5854b90978ee8aa95f1d05abee0db4beedb412a8536b9e7d15c8f5a399359385"

      def install
        bin.install "mise-v2026.5.16-macos-x64" => "mise"
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
