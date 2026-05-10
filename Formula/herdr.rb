class Herdr < Formula
  desc "Supervise multiple coding agents in one terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "3cddcebc6ecff65fd0d199a40586140e541223cbf98aedb8159fc37728c28809"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "9a99bbe00b24b3a7cb2fa8df3171785a1d1285115105a81268e01a8a0fafd7b5"

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