# Keep the distribution together: nsh finds its runtimes next to bin/nsh.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.5.0/nsh-macos-arm64.tar.gz"
  sha256 "e6722427b391b00cf7ec13137db9366e78d1e7a045f2933cf00b340365309d9d"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.5.0/nsh-linux-x86_64.tar.gz"
      sha256 "a422bbe5dc2a7ae3ff308ee56e05d73d5becc81f57adf11447fc570dcee65e0f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nsh"
  end

  test do
    assert_match "nsh #{version}", shell_output("#{bin}/nsh --version")
    system bin/"nsh", "init", "hello"
    assert_path_exists testpath/"hello"
  end
end
