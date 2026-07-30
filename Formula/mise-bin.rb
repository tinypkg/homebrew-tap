class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.7.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.7.17/mise-v2026.7.17-macos-arm64"
      sha256 "db3423b55cb5cfb6f7331d9c0416d6817c85a32101bc7fee6f553b42bbcc9adb"

      def install
        bin.install "mise-v2026.7.17-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.7.17/mise-v2026.7.17-macos-x64"
      sha256 "27bf34b8d8ddd6f4ca027cee5a2c860dbe18b072e0e646325520c206d64f10c9"

      def install
        bin.install "mise-v2026.7.17-macos-x64" => "mise"
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
