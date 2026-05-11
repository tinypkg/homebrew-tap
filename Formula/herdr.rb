class Herdr < Formula
  desc "Supervise multiple coding agents in one terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "0c973f59168f64f67735871a84b42cda25c2bf33088b5b34bd14053475cf749f"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "e322b502a7eec2f4f1fe6c183e6b2fc2f7d68500b42f1f3ba3a325152562e0c6"

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