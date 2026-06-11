class Herdr < Formula
  desc "agent multiplexer that lives in your terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "6513b75b754733fab870059fad8b7ef67ae73f5d811250ec45ad991fcd9f7794"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "6dd72b8927832195435eb394406ef6301bd99e4b02e56dc312ed0c509f52a46b"

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