class Snout < Formula
  desc "Rime input method initialization and update tool - supports Wanxiang/Wusong/Baishuang/Bohe schemes"
  homepage "https://github.com/ca-x/snout"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ca-x/snout/releases/download/v0.5.3/snout-v0.5.3-macos-aarch64"
      sha256 "b1fd9268ccd4ee8b65ea268c6477e5e215a072d84262a3a4e5ccc44bdbba8422"

      def install
        bin.install "snout-v0.5.3-macos-aarch64" => "snout"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ca-x/snout/releases/download/v0.5.3/snout-v0.5.3-macos-x86_64"
      sha256 "ebaa70a0f629b4155c20bb35b94d05a3d2278ffe93b899ffe45d92e475b5304c"

      def install
        bin.install "snout-v0.5.3-macos-x86_64" => "snout"
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