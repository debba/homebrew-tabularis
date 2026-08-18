cask "tabularis" do
  arch arm: "aarch64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "5be5c243df26f2b2995a9780a915f5977a02b818df90f3cc8709a087d1b75d8f",
         intel: "5e0cc0f44f200fa380a62e32841fee828864cf1d04ddf50a47a141292dc2b888"

  url "https://github.com/TabularisDB/tabularis/releases/download/v#{version}/tabularis_#{version}_#{arch}.dmg"
  name "Tabularis"
  desc "Lightweight, developer-focused database management tool"
  homepage "https://github.com/TabularisDB/tabularis"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on macos: :monterey

  app "tabularis.app"
  
  postflight do
  system_command "xattr",
                  args: [
                      "-c", "#{appdir}/tabularis.app"
                  ]
  end

  zap trash: [
    "~/Library/Application Support/tabularis",
    "~/Library/Caches/tabularis",
    "~/Library/Logs/tabularis",
    "~/Library/Preferences/com.debba.tabularis.plist",
    "~/Library/Saved Application State/com.debba.tabularis.savedState",
  ]
end
