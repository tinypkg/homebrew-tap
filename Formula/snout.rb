class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.5.4/snout-v0.5.4-macos-aarch64"
      sha256 "2771ee3727d94fb7240d71e5f473a4cb4e5395173bb20a3c2e84b65ba1bfd4fe"

      def install
        bin.install "snout-v0.5.4-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.5.4/snout-v0.5.4-macos-x86_64"
      sha256 "1bbbdee58de888c5e6393e7f43b74f3610e155cc9b5232a74e1240b92494bb2e"

      def install
        bin.install "snout-v0.5.4-macos-x86_64" => "snout"
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