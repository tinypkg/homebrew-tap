class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.12/snout-v0.2.12-macos-aarch64"
      sha256 "4a754c885301853b03f6f0d486db968880cb3debfc8c38875ecc71296098776f"

      def install
        bin.install "snout-v0.2.12-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.12/snout-v0.2.12-macos-x86_64"
      sha256 "1e584c98005d1ace8ba1bf52d09267eda719d09a7a51acd186bf555e11e84b33"

      def install
        bin.install "snout-v0.2.12-macos-x86_64" => "snout"
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