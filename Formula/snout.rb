class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.1.7/snout-v0.1.7-macos-aarch64"
      sha256 "861d1a440ffca22bba97253418ada02c0c87e991dbd43e6ad9c5fbb512e88ff5"

      def install
        bin.install "snout-v0.1.7-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.1.7/snout-v0.1.7-macos-x86_64"
      sha256 "cf5df9ec4742be12e73f47f357a084c7afd6ca80e38eaab376ddde5f99ff0eae"

      def install
        bin.install "snout-v0.1.7-macos-x86_64" => "snout"
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