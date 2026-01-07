cask "lzc-client-desktop" do
  version "1.6.7"

  on_intel do
    sha256 "6c7e5373950c04b8c9a4a78f75a7ce44468b6fb3a220e1b8b56b12170438286a"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "c86c7fed7e1dc5ee9d5f45d6b981f2426d4a2398499f4e529cd5cb3f2976c3f3"
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
