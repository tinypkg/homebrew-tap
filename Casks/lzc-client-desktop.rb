cask "lzc-client-desktop" do
  version "1.6.30"

  on_intel do
    sha256 "7ab7a0bff6b46d04793c9b8e579eaacacbede096ff44a8d34bedec5860f5a153"
    url "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v#{version}_x64.dmg"
  end

  on_arm do
    sha256 "93b56c844cb2c0abec43c7777e981b07e22e05fe5c1b04903341bd805b3da3ff"
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
