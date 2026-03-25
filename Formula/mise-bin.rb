class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.3.14/mise-v2026.3.14-macos-arm64"
      sha256 "bfd482ed640777a9001fd9ceff7bae26d0ca1c14cf785c849b01f5bb8cb04f63"

      def install
        bin.install "mise-v2026.3.14-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.3.14/mise-v2026.3.14-macos-x64"
      sha256 "d07c404ec8334eacdde7ad108293fa80765398928de9e88e183bc414d499c6b8"

      def install
        bin.install "mise-v2026.3.14-macos-x64" => "mise"
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
