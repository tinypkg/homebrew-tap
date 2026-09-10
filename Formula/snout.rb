class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.11/snout-v0.2.11-macos-aarch64"
      sha256 "82b56f1cb9d1c0011878d49496d2c0a1a974a62d3892c9170799ce1796943e04"

      def install
        bin.install "snout-v0.2.11-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.11/snout-v0.2.11-macos-x86_64"
      sha256 "a4a17585f9dc8b67e5046ba30a706362dfcf02211daf18e289f4065a067e33f3"

      def install
        bin.install "snout-v0.2.11-macos-x86_64" => "snout"
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