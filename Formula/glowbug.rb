class Glowbug < Formula
  desc "Host daemon for Glowbug - the machined aluminum bar that shows your coding-agent sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "44708f97c445e19eb29791609704d1649a31587d57141c93b587cb3bb3ca26ee"
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
