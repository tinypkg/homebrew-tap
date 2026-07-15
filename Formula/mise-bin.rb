class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.7.6/mise-v2026.7.6-macos-arm64"
      sha256 "e5edb8df5c1e4ab99ace4869871614b47617e1bb314239d73d72e7f9aba88915"

      def install
        bin.install "mise-v2026.7.6-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.7.6/mise-v2026.7.6-macos-x64"
      sha256 "a699bd8fbc86f53346b07dc5916e32351e687e9b9d0d65bbd0e1c50bf0f1fec4"

      def install
        bin.install "mise-v2026.7.6-macos-x64" => "mise"
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
