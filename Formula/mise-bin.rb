class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.8.14/mise-v2026.8.14-macos-arm64"
      sha256 "ba93b3fe7e47964e4392d40c8b7bfa5740e8c2a0a575e3e86268e9764082ed3e"

      def install
        bin.install "mise-v2026.8.14-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.8.14/mise-v2026.8.14-macos-x64"
      sha256 "02fdcaac111c2eb056432172c1c5c469b335dfd95115140c3c5524a24a889c12"

      def install
        bin.install "mise-v2026.8.14-macos-x64" => "mise"
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
