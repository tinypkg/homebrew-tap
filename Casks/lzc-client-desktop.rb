cask "lzc-client-desktop" do
  version "2.0.28"

  on_intel do
    sha256 "22745f8ca8933e66367ed627a64a490232045fdd2e96fe011093b99e08464246"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "97ad528d16e6fb120da54d682e4f94d9ac128ace8fe8010a42e1ad6e3e0b4e2f"
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
