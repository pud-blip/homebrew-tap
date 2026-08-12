class Glowbug < Formula
  desc "Host daemon for Glowbug - the desk device that shows your Claude Code sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud-blip/glowbug/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "28bbe3ced718faae8af55129756ee9ad8a54dc143b855bf9d3940ffdd871b5c2"
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
