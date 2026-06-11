class Kryofetch < Formula
  desc "System fetch tool for macOS, built with the Krypton language"
  homepage "https://github.com/t3m3d/kryofetch"
  version "1.2.17"
  license "MIT"

  on_arm do
    url "https://github.com/t3m3d/kryofetch/releases/download/v1.2.17/kryofetch-1.2.17-macos-arm64.tar.gz"
    sha256 "72e081c2c3386de4cf5c5f9b9429e1a276047a984f788d105e28875dd4c62486"
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
