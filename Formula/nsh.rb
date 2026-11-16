# Keep the distribution together: nsh finds its runtimes next to bin/nsh.
class Nsh < Formula
  desc "Native UI from TSX modules, with a CLI and prebuilt runtimes"
  homepage "https://nsh.dev"
  # A default URL lets unsupported architectures reach the requirements check.
  url "https://github.com/longbridge/nsh/releases/download/v0.5.1/nsh-macos-arm64.tar.gz"
  sha256 "2710affd59e6345b6f87dfa1f579c36b9a9d7a58992b8399d14f39290da048a3"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/longbridge/nsh/releases/download/v0.5.1/nsh-linux-x86_64.tar.gz"
      sha256 "f34729e613196ca122d956deb543a92f319e053ff17dfc09ba04a6ec2fb79c74"
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
