class Kryofetch < Formula
  desc "System fetch tool for macOS, built with the Krypton language"
  homepage "https://github.com/t3m3d/kryofetch"
  version "1.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/t3m3d/kryofetch/releases/download/v1.2.1/kryofetch-1.2.1-macos-arm64.tar.gz"
    sha256 "9b7fef48502a750bf28f69576d95e627f8499e715cc910e7ccbc4e1bbf52be54"
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
