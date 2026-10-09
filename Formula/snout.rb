class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.2.14/snout-v0.2.14-macos-aarch64"
      sha256 "6fcfdda1a462121b408f140af26addde5baab1b3dff74517ee3c4e5fb2b0299a"

      def install
        bin.install "snout-v0.2.14-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.2.14/snout-v0.2.14-macos-x86_64"
      sha256 "250dad747dfd2c68bbd543440748524859438be477e753d5ce97a6e178908c34"

      def install
        bin.install "snout-v0.2.14-macos-x86_64" => "snout"
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