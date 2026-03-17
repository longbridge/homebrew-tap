class LongbridgeTerminal < Formula
  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.7.0/longbridge-terminal-darwin-arm64.tar.gz"
            sha256 "6c2b44586ea4c280e362b01023896808fdd2cbece6aa9c7654ac41b0d66bdd91"
    end

    on_intel do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.7.0/longbridge-terminal-darwin-amd64.tar.gz"
            sha256 "f14e96c2cbf79c060a865a4f5d2ddac402d815319e9438ace7db31bb199c4986"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "longbridge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/longbridge --version")
  end
end
