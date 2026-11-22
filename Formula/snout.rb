class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.5.5/snout-v0.5.5-macos-aarch64"
      sha256 "4716c35ece34c4411486a18ebb774b266049a10e34e1dbb0f160a193f3f59a88"

      def install
        bin.install "snout-v0.5.5-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.5.5/snout-v0.5.5-macos-x86_64"
      sha256 "97e3b99933d56269e94f06f2faa65ec7a32dac1c0b404e2be07b2cf54b8ca427"

      def install
        bin.install "snout-v0.5.5-macos-x86_64" => "snout"
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