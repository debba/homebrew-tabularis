cask "tabularis" do
  arch arm: "aarch64", intel: "x64"

  version "0.18.0"
  sha256 arm:   "4a3c9fd47a5699791de534ba875a881f84a837d6553a84926b3f14813d80ca9b",
         intel: "4e593a56a624bdf4721c4b2fdb2cddeeac4162fd0c939845909e49e53bc61fc0"

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
