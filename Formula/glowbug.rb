class Glowbug < Formula
  desc "Host daemon for Glowbug - the desk device that shows your Claude Code sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v1.4.16.tar.gz"
  sha256 "1929c484ab8944ab0e79c1a4adf8dc6b8a95d7dd106a559293b3f3fcd45c5165"
  license "MIT"

  depends_on "dfu-util"   # `glowbug rescue` flashes over USB DFU

  def install
    # keep firmware/ (the rescue image) beside the script — it locates the
    # image relative to its own real path
    libexec.install "glowbug.py", "firmware"
    bin.write_exec_script libexec/"glowbug.py"
    mv bin/"glowbug.py", bin/"glowbug"
  end

  test do
    assert_match "glowbug", shell_output("#{bin}/glowbug --version")
  end
end
