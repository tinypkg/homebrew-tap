class Herdr < Formula
  desc "agent multiplexer that lives in your terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "24992e1625dbdcb18354a59e299e4b263c312400b31396cdc07cd46ed57f24a7"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "ddf430133352e1712413d5d865b34a485546f4658893fc89986257d65a7585a8"

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