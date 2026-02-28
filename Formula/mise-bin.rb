class MiseBin < Formula
  desc "The front-end to your dev env (polyglot version manager)"
  homepage "https://mise.jdx.dev/"
  version "2026.2.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jdx/mise/releases/download/v2026.2.22/mise-v2026.2.22-macos-arm64"
      sha256 "dfb32a3563b54fde4782cbbaa04aee2842365a69a0ac406930de1f1794849b81"

      def install
        bin.install "mise-v2026.2.22-macos-arm64" => "mise"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdx/mise/releases/download/v2026.2.22/mise-v2026.2.22-macos-x64"
      sha256 "a699e30f1c8d44c412b94b6781fba7ee70b8c26ccd397ee675df135db73bde5e"

      def install
        bin.install "mise-v2026.2.22-macos-x64" => "mise"
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
