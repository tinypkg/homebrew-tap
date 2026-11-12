class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.5.1/snout-v0.5.1-macos-aarch64"
      sha256 "6941379959688f0041f62f3c0e5449869126519b75ddeacc35b2d9899c486708"

      def install
        bin.install "snout-v0.5.1-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.5.1/snout-v0.5.1-macos-x86_64"
      sha256 "73eea9ce3ccd28b1c1898ff3291b3a308f0b224da50013b8df0b41b1eb37356c"

      def install
        bin.install "snout-v0.5.1-macos-x86_64" => "snout"
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