class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.13/snout-v0.2.13-macos-aarch64"
      sha256 "fede553867e97f985e5ec235c28a4cc8f3a108c6b05ef3f5b67bfb9e68ca6247"

      def install
        bin.install "snout-v0.2.13-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.13/snout-v0.2.13-macos-x86_64"
      sha256 "0a75a889d31a54657eba1cd811804c02655878d5ee8c559ae9909db955e68441"

      def install
        bin.install "snout-v0.2.13-macos-x86_64" => "snout"
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