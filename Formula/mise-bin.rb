class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.24/mise-v2026.2.24-macos-arm64"
      sha256 "f3f681e93496fb216f50a2006ccc7c17994d4b891d0c0541c13300ce47b6e2b4"

      def install
        bin.install "mise-v2026.2.24-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.24/mise-v2026.2.24-macos-x64"
      sha256 "e6497104e4418f529a54eb28ab0161dfc7cc4540f7b2ab2a4a1fd36365a123e3"

      def install
        bin.install "mise-v2026.2.24-macos-x64" => "mise"
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
