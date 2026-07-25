class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.7.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.7.13/mise-v2026.7.13-macos-arm64"
      sha256 "ef747f4bd944d7cb4efe1832ec6cd29dfdbc217389122fa37c20d116d90c1eb6"

      def install
        bin.install "mise-v2026.7.13-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.7.13/mise-v2026.7.13-macos-x64"
      sha256 "3cd0f468c4c8ba1196d949441cb84eeaebb92b94666ef8caa17602c82421f420"

      def install
        bin.install "mise-v2026.7.13-macos-x64" => "mise"
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
