cask "feeluown" do
  version "4.1.13,14.7.6"
  sha256 "f13bd09d00523c7640f7ec9a1b96299667a8a9e2bac2423661fca9eaee6ed102"

  url "https://github.com/feeluown/FeelUOwn/releases/download/v#{version.csv.first}/FeelUOwnX-macOS#{version.csv.second}-arm64.zip",
      verified: "github.com/feeluown/FeelUOwn/"
  name "FeelUOwn"
  desc "一个稳定、用户友好以及高度可定制的音乐播放器"
  homepage "https://feeluown.readthedocs.io/"

  livecheck do
    url "https://github.com/feeluown/FeelUOwn/releases"
    regex(%r{v(\d+(\.\d+)+)/FeelUOwnX-macOS(\d+(\.\d+)+)-arm64\.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[3]}"
      end
    end
  end

  auto_updates true

  app "FeelUOwnX.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/org.feeluown.FeelUOwnX",
    "~/Library/Saved Application State/org.feeluown.FeelUOwnX.savedState",
  ]
end
