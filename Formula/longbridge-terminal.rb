class LongbridgeTerminal < Formula
  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v#{version}/longbridge-terminal-darwin-arm64.tar.gz"
      sha256 "4fbb5d999cdd41fbb34ab245eea7c6171d252de7aa498ae53ef325fd899f0262"
    end

    on_intel do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v#{version}/longbridge-terminal-darwin-amd64.tar.gz"
      sha256 "0524998ab342d7d0f0f468039d5d730b1073f8cc30a269c3e1cb839c0dd2a673"
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
