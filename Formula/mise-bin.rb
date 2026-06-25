class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.6.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.6.14/mise-v2026.6.14-macos-arm64"
      sha256 "2f70a4df7f12d50226c34b857821c80f911b382598cf3f7972e9d0dee0706bb9"

      def install
        bin.install "mise-v2026.6.14-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.6.14/mise-v2026.6.14-macos-x64"
      sha256 "4afa2119311abfff0b1c8ff55fbd55004f1d1b54f3cb02f69d21b73ce9f92e7f"

      def install
        bin.install "mise-v2026.6.14-macos-x64" => "mise"
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
