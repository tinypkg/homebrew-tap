class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.11.3/mise-v2026.11.3-macos-arm64"
      sha256 "6d39119ab914c54ab865204dee9337c71b83a7ed1e730f663c2fc3453e38fe9c"

      def install
        bin.install "mise-v2026.11.3-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.11.3/mise-v2026.11.3-macos-x64"
      sha256 "49f32abd93f54147af0599a1c9583d2092df8e7250c9fe635783a7932c4087ef"

      def install
        bin.install "mise-v2026.11.3-macos-x64" => "mise"
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
