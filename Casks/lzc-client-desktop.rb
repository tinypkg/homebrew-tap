cask "lzc-client-desktop" do
  version "2.1.3"

  on_intel do
    sha256 "db0e20374994b1dfd423858569751fd4867945379de635785d6a92fd8e629647"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "117f7e1c2634a515e65b0e3471c951b521eee7b32b15d1f6a56f1f0c80586075"
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
