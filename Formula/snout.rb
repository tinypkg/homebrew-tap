class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.0/snout-v0.2.0-macos-aarch64"
      sha256 "fee9ae102add0412dc75c3a6043d63ca4aabf05f561c6465db15da542923d906"

      def install
        bin.install "snout-v0.2.0-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.0/snout-v0.2.0-macos-x86_64"
      sha256 "abe1240b7f8c6ffbbaa5df43df2bda598ea45d3d75907a0eb5afebc8ae678c7b"

      def install
        bin.install "snout-v0.2.0-macos-x86_64" => "snout"
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