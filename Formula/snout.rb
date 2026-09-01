class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.10/snout-v0.2.10-macos-aarch64"
      sha256 "f1fc7d6d6964a0abdb053f483fd39b7a24b3c05384cb35effa1ae8272b6668bf"

      def install
        bin.install "snout-v0.2.10-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.10/snout-v0.2.10-macos-x86_64"
      sha256 "03ac188196ab0d1e2ae29a947d38bd713253f3064f83bf0aed6dcbc995762dad"

      def install
        bin.install "snout-v0.2.10-macos-x86_64" => "snout"
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