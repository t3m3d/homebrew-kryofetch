class Kryofetch < Formula
  desc "System fetch tool for macOS, built with the Krypton language"
  homepage "https://github.com/t3m3d/kryofetch"
  version "1.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/t3m3d/kryofetch/releases/download/v1.3.0/kryofetch-1.3.0-macos-arm64.tar.gz"
    sha256 "99a38a8843a2af03c2b5d0c1dfbe2ad7cf424ae6c073cff76549f285f44a71d6"
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
