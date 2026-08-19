class Glowbug < Formula
  desc "Host daemon for Glowbug - the machined aluminum bar that shows your coding-agent sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v1.4.18.tar.gz"
  sha256 "ee8c4bd0135462c0a14f39eb98da13c80a868c3e3fe8dc9412078eb2646c9d46"
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
