cask "blink1control2" do
  version "2.2.9"

  on_arm do
    sha256 "5201cc77aa1b51b927d90e59f6221ff55f147f5910f6e75b6acd0966b3f4c099"

    url "https://github.com/todbot/Blink1Control2/releases/download/v#{version}/Blink1Control2-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "fa4a8457f905b6e7ef288c621fed646305ac31408932a9cfa7181fde41499ec2"

    url "https://github.com/todbot/Blink1Control2/releases/download/v#{version}/Blink1Control2-#{version}-mac-x64.dmg"
  end

  name "Blink1Control2"
  desc "Blink1Control GUI to control blink(1) USB RGB LED devices"
  homepage "https://github.com/todbot/Blink1Control2"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Blink1Control2.app"
end
