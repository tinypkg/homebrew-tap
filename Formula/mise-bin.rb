class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.3.9/mise-v2026.3.9-macos-arm64"
      sha256 "8a0e317ec62930eb3bbaaff25fcb2c75e667f7e1c06374750882531897366afe"

      def install
        bin.install "mise-v2026.3.9-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.3.9/mise-v2026.3.9-macos-x64"
      sha256 "4302600cbbfc1b4c69d0d39f0ec008c1783de7f373c9f036eec0f4d84f8f2cdb"

      def install
        bin.install "mise-v2026.3.9-macos-x64" => "mise"
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
