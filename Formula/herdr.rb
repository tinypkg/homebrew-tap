class Herdr < Formula
  desc "agent multiplexer that lives in your terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.6.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "f48bbaafd60b3a33d783eca4dfe7243a3f96e557e55240f6ed53dd0b9b73670b"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "c99826b882363951f22405d889ec0c5574887093830d390c99b286c0949a0c73"

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