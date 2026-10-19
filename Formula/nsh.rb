# Keep the distribution together: nsh finds its runtimes next to bin/nsh.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.1.1/nsh-macos-arm64.tar.gz"
  sha256 "2711fc56eb93f326f3ad7f6d9a00d3ef846dd5b0440ccbb1c404a2480a3b58f6"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.1.1/nsh-linux-x86_64.tar.gz"
      sha256 "2582993561a5de511ba7f0d6ee526293e648321a055f0a707ddd86558f3ab289"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nsh"
  end

  test do
    assert_match "nsh #{version}", shell_output("#{bin}/nsh --version")
    system bin/"nsh", "init", "hello"
    system bin/"nsh", "package", "hello", "--target", "web"
    assert_path_exists testpath/"out/hello/index.html"
    refute_empty (testpath/"out/hello").glob("nsh.*.wasm")
    refute_empty (testpath/"out/hello").glob("nsh.*.js")
  end
end
