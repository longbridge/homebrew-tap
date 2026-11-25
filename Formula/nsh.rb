# Keep the distribution together: nsh finds its runtimes next to bin/nsh and
# installs the components it needs (`nsh component`) there.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.7.0/nsh-macos-arm64.tar.gz"
  sha256 "5b2e5385e09a65ed63b178a8dd9cef03a9dcab204d2efc942300e0c5baea3853"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.7.0/nsh-linux-x86_64.tar.gz"
      sha256 "d281bfa3d93d84e9831e1a97dfdb63104329fcc87a0a48c78db5aeabb00c0073"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nsh"
  end

  test do
    assert_match "nsh #{version}", shell_output("#{bin}/nsh --version")
    system bin/"nsh", "init", "hello"
    system bin/"nsh", "build", "hello", "-o", testpath/"out", "--release"
    assert_path_exists testpath/"out/bundle.nshc"
    # Other platforms' runtimes are components, added when first needed.
    # Releases before `nsh component` (0.4.0 and older) bundle them instead.
    if shell_output("#{bin}/nsh --help").include?("component")
      assert_match "android", shell_output("#{bin}/nsh component list 2>&1")
    end
  end
end
