class Glowbug < Formula
  desc "Host daemon for Glowbug - the desk device that shows your Claude Code sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud-blip/glowbug/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "54533b07d82d0e726de1ed4d5e3f04214d417022653db1e778773ae03e762889"
  license "MIT"

  def install
    bin.install "glowbug.py" => "glowbug"
  end

  test do
    assert_match "glowbug", shell_output("#{bin}/glowbug --version")
  end
end
