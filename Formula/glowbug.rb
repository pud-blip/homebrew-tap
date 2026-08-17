class Glowbug < Formula
  desc "Host daemon for Glowbug - the desk device that shows your Claude Code sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v1.4.15.tar.gz"
  sha256 "8f23532cf2762a5499bd153729794ae74eeb7c76cf8cfbfef3a43dc8cf97f767"
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
