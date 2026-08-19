class Glowbug < Formula
  desc "Host daemon for Glowbug - the machined aluminum bar that shows your coding-agent sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v1.4.19.tar.gz"
  sha256 "7f0f69e5f07da3f66ca98e5324d0e7d4926362ef00d1300cdbfb53f508d3117f"
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
