class Herdr < Formula
  desc "agent multiplexer that lives in your terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "1344fd18741aa4d01723c37ad3e22f38fe1626e4090b5435ab1757c66f2a17d5"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "53537af41ede73618c8015e9c5b74a4d1954330123a2f2386d3a7bad67f2d49f"

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