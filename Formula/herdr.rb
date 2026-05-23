class Herdr < Formula
  desc "agent multiplexer that lives in your terminal"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "186f89a03deb8011e1698114710fb49179562b9876d52feaec5cacbb765dd1ca"

      def install
        bin.install "herdr-macos-aarch64" => "herdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ogulcancelik/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "6557f8fa2e849fca27a739fdaf81697218e10a50f7130d9cd4bfe523c2f188ae"

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