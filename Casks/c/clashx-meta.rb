cask "clashx-meta" do
  version "1.3.18"
  sha256 "d86834161441551ad602ca269edb10653a8a0a8f4f2197a75cd26a6595f80d33"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "ClashX Meta"
  desc "Rule based proxy base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "ClashX Meta.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/ClashX Meta.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.metacubex.ClashX.meta",
    "~/Library/Caches/com.metacubex.ClashX.meta",
    "~/Library/HTTPStorages/com.metacubex.ClashX.meta",
    "~/Library/Logs/ClashX meta",
    "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
  ]
end