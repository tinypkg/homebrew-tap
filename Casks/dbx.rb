cask "dbx" do
  version "0.3.3"

  on_arm do
    url "https://github.com/t8y2/dbx/releases/download/v#{version}/dbx_#{version}_aarch64.dmg",
        verified: "github.com/t8y2/dbx/"
    sha256 "ae6f5845ef35d00093e74ab781411724094b498d112d6fd4bae63738a788999e"
  end

  on_intel do
    url "https://github.com/t8y2/dbx/releases/download/v#{version}/dbx_#{version}_x64.dmg",
        verified: "github.com/t8y2/dbx/"
    sha256 "f64b16d6d0f55efa16b7c90a4347bc4dbc505645eed6f7d03dc223bcab8f7506"
  end

  name "DBX"
  desc "Open-source database management tool"
  homepage "https://github.com/t8y2/dbx"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "dbx.app"

  zap trash: [
    "~/Library/Application Support/com.dbx.app",
    "~/Library/Caches/com.dbx.app",
    "~/Library/Preferences/com.dbx.app.plist",
    "~/Library/Logs/com.dbx.app",
  ]
end