class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.1.1/snout-v0.1.1-macos-aarch64"
      sha256 "fe78fd1d852278d4200e1cd5da3deff12963d325a652bb435e9590c151bf1b5c"

      def install
        bin.install "snout-v0.1.1-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.1.1/snout-v0.1.1-macos-x86_64"
      sha256 "dfd6202f81ca65858fd2d43174d3012c67e683a52b02a612143e2a271bfd7ca1"

      def install
        bin.install "snout-v0.1.1-macos-x86_64" => "snout"
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