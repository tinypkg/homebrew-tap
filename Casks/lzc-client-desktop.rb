cask "lzc-client-desktop" do
  version "2.0.13"

  on_intel do
    sha256 "c1375a5823e43d6d0e8147faec112052eeb4596e0b1ceb50f9aa074ceafeab99"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "d23dbd516712657ebbbc035cfa3f559022bc76f6ea95dca686e655f6417dbdba"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_arm64.dmg"
  end

  name "LazyCat Client Desktop"
  desc "LazyCat desktop client application"
  homepage "https://lazycat.cloud/"

  livecheck do
    arch_suffix = Hardware::CPU.intel? ? "x64" : "arm64"
    url "https://dl.lazycat.cloud/client/desktop/lzc-client-desktop_#{arch_suffix}.dmg.metadata.json"
    strategy :json do |json|
      json["buildVersion"]&.delete_prefix("v")
    end
  end

  app "懒猫微服.app"

  zap trash: [
    "~/Library/Application Support/LazyCat",
    "~/Library/Preferences/com.lazycat.client.plist",
    "~/Library/Caches/com.lazycat.client",
    "~/Library/Logs/LazyCat",
  ]
end
