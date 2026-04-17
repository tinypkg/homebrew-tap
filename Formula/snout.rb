class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.1/snout-v0.2.1-macos-aarch64"
      sha256 "32dc43d55d051f7b26d962c263932aa729785a7ef1cec3ff0545a6942103ef2d"

      def install
        bin.install "snout-v0.2.1-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.1/snout-v0.2.1-macos-x86_64"
      sha256 "4388d7295ac85814d00e0cdc435c1a28acb99e5aea5fb86e57104d12aba721ed"

      def install
        bin.install "snout-v0.2.1-macos-x86_64" => "snout"
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