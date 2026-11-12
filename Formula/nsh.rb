# Keep the distribution together: nsh finds its runtimes next to bin/nsh.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.4.0/nsh-macos-arm64.tar.gz"
  sha256 "f63c3d57c31b28c9b34227aac81f099d1e0e61f1db552a6ec5127d114eaf59cb"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.4.0/nsh-linux-x86_64.tar.gz"
      sha256 "8806121aebf40bb51f8fb6aa703722fbb01253f9a435759c18d53beece1ec976"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nsh"
  end

  test do
    assert_match "nsh #{version}", shell_output("#{bin}/nsh --version")
    system bin/"nsh", "init", "hello"
    # Since 0.5.0 runtimes are installed on demand into libexec, which the
    # test sandbox cannot write, so only check the scaffolded project here.
    assert_predicate testpath/"hello", :directory?
  end
end
