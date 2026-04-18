class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.3/snout-v0.2.3-macos-aarch64"
      sha256 "407800da177646fa1dcfe3c852f378914fee4ee83e0afbf806ca4f4ab78a2a72"

      def install
        bin.install "snout-v0.2.3-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.3/snout-v0.2.3-macos-x86_64"
      sha256 "d0267dd1f31e665e8bd89ac93d4f6f87467d2297624495606c6bdeabbec674c4"

      def install
        bin.install "snout-v0.2.3-macos-x86_64" => "snout"
      end
    end
  end

  def caveats
    <<~EOS
      snout has been installed!
      Run 'snout --help' to get started.

      Supported Rime schemes:
      - Wanxiang (万象)
      - Wusong (雾凇)
      - Baishuang (白霜)
      - Bohe (薄荷)
    EOS
  end

  test do
    system "#{bin}/snout", "--version"
  end
end