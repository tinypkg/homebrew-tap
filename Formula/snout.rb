class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.3.0/snout-v0.3.0-macos-aarch64"
      sha256 "43def6650fd31ead039ef8ef5d9325895635245bece0fcf5284374094498f0a0"

      def install
        bin.install "snout-v0.3.0-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.3.0/snout-v0.3.0-macos-x86_64"
      sha256 "a00228e87e417cb1524b4413193a2387fb0c72ba151c498391b56720d0771238"

      def install
        bin.install "snout-v0.3.0-macos-x86_64" => "snout"
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