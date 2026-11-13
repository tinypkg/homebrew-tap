class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.5.2/snout-v0.5.2-macos-aarch64"
      sha256 "e431f71cdc986dd405a6588b4374c29f98cdd54d76b153717c4bbfd862f4611f"

      def install
        bin.install "snout-v0.5.2-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.5.2/snout-v0.5.2-macos-x86_64"
      sha256 "d1411940261a116e56aa900ff9b2aab084b54a5fa7eb8bdaae17c7b06746d243"

      def install
        bin.install "snout-v0.5.2-macos-x86_64" => "snout"
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