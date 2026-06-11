class Kryofetch < Formula
  desc "System fetch tool for macOS, built with the Krypton language"
  homepage "https://github.com/t3m3d/kryofetch"
  version "1.2.9"
  license "MIT"

  on_arm do
    url "https://github.com/t3m3d/kryofetch/releases/download/v1.2.9/kryofetch-1.2.9-macos-arm64.tar.gz"
    sha256 "6d1c3d02132c92c1d8c7c72746ee921bd8239c5242633945d918bf3e5b1c1659"
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
