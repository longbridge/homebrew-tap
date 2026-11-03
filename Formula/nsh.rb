# Keep the distribution together: nsh finds its runtimes next to bin/nsh.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.2.0/nsh-macos-arm64.tar.gz"
  sha256 "a189be8537422a147131c88d7fd39d73265a6aebfbb530287c36a393ff3953fc"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.2.0/nsh-linux-x86_64.tar.gz"
      sha256 "8901628a9e9785ce1d92056acbe0dad9405a05e6f262c5b66b996e23c1dfff83"
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
    assert_path_exists testpath/".nsh/out/hello/index.html"
    refute_empty (testpath/".nsh/out/hello").glob("nsh.*.wasm")
    refute_empty (testpath/".nsh/out/hello").glob("nsh.*.js")
  end
end
