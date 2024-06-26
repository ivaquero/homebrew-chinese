cask "vlc-cn" do
  arch arm: "arm64", intel: "intel64"

  version "3.0.20"
  sha256 arm:   "5d5f0ee52d81982a622f4021928a64b4705a9554499e20c33d0bac22590b118e",
         intel: "a4dc1441fcab8e2b90c62974ce5399bb88acbf6c70d54f21c6158d9fb1fba279"

  url "https://mirrors.tuna.tsinghua.edu.cn/videolan-ftp/vlc/last/macosx/vlc-#{version}-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/videolan-ftp/vlc/"
  name "VLC media player"
  desc "Multimedia player"
  homepage "https://www.videolan.org/vlc/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/videolan-ftp/vlc/last/macosx"
    regex(/vlc-(\d+(\.\d+){2})-#{arch}\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: ["homebrew/cask-versions/vlc-nightly", "vlc"]

  app "VLC.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/vlc.wrapper.sh"
  binary shimscript, target: "vlc"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/VLC.app/Contents/MacOS/VLC' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.videolan.vlc.sfl*",
    "~/Library/Application Support/org.videolan.vlc",
    "~/Library/Application Support/VLC",
    "~/Library/Caches/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc.plist",
    "~/Library/Saved Application State/org.videolan.vlc.savedState",
  ]
end
