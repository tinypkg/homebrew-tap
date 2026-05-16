class Herdr < Formula
  desc "Supervise multiple coding agents in one terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "8b796f3717862aae81daae5b9d6c1f1929d758aacea0b4433bbf5300ed2ca6ac"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "00e6c346dcc48c1cebfb313c7f120a1f60426af8a41860837210c82f6657bcb0"

      def install
        bin.install "herdr-macos-x86_64" => "herdr"
      end
    end
  end

  def caveats
    <<~EOS
      herdr has been installed!
      Run 'herdr --help' to get started.
    EOS
  end

  test do
    system "#{bin}/herdr", "--version"
  end
end