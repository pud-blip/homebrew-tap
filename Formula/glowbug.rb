class Glowbug < Formula
  desc "Host daemon for Glowbug - the machined aluminum bar that shows your coding-agent sessions"
  homepage "https://glowbug.dev"
  url "https://github.com/pud/glowbug/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "1c3607d6fdf6ca846aab82b62ec0b239a3bfbee633bc797af778ed1e1e4ad97d"
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
