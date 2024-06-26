class Ollamaplist < Formula
  desc "给 Ollama CLI 添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  version "0.2.2"

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  if OS.mac?
    url "https://github.com/Mrered/Gobin/releases/download/v#{version}/ollamaplist_#{version}_darwin_#{arch}.tar.gz"
    if Hardware::CPU.arm?
      sha256 "9ffa61dfdc430d21c7e675205a3a73768f9a063065e8b8f9a55b3b3b71d24ebf"
    else
      sha256 "d311991876899604b5000730e21f0c17c38d34fef4a5d2e6f00ade044250d008"
    end
  end

  livecheck do
    url "https://github.com/Mrered/Gobin/releases"
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end

  def post_install
    chmod 0555, bin/"ollamaplist"
  end
end
