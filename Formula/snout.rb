class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.4.1/snout-v0.4.1-macos-aarch64"
      sha256 "96281708cbd8012a53f5f03e2760a1e5e2540d6186ed3c0c996cc74db1ce2164"

      def install
        bin.install "snout-v0.4.1-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.4.1/snout-v0.4.1-macos-x86_64"
      sha256 "0f83f54c3cc8ed739a3867f33ac0a585816738aa95a6c18c7d79b787ecd05fd2"

      def install
        bin.install "snout-v0.4.1-macos-x86_64" => "snout"
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