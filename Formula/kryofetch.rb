class Kryofetch < Formula
  desc "System fetch tool for macOS, built with the Krypton language"
  homepage "https://github.com/t3m3d/kryofetch"
  version "1.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/t3m3d/kryofetch/releases/download/v1.2.0/kryofetch-1.2.0-macos-arm64.tar.gz"
    sha256 "7a7a08c9a91eee779a5fc4e6a2dc81aeb6d0f7a93d012301591cfc3b625306a4"
  end

  def install
    bin.install "kryofetch"
    system "codesign", "-s", "-", "-f", "#{bin}/kryofetch"
  end

  test do
    output = shell_output("#{bin}/kryofetch 2>&1 || true")
    assert_includes output, "KryoFetch"
  end
end
