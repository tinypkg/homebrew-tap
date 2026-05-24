class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.5.15/mise-v2026.5.15-macos-arm64"
      sha256 "e0d1650ad52947bd9ce3b5499a57d843a4609b270735cbd98fc5e1f9159ea136"

      def install
        bin.install "mise-v2026.5.15-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.5.15/mise-v2026.5.15-macos-x64"
      sha256 "eb9f13534a540a31cab125bb910e36aa46f1a0dd0f638e5fa7b63db89815500b"

      def install
        bin.install "mise-v2026.5.15-macos-x64" => "mise"
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
