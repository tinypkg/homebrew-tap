class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.4.2/snout-v0.4.2-macos-aarch64"
      sha256 "58a72d7722bac9732f4a666361a9195f75d50a0cbbd0e9c03cb194968159a8b8"

      def install
        bin.install "snout-v0.4.2-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.4.2/snout-v0.4.2-macos-x86_64"
      sha256 "92372f3a0e64f07f553b410e28e8e925d770ed60c718f36ad4fe9e0d6545414b"

      def install
        bin.install "snout-v0.4.2-macos-x86_64" => "snout"
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