class LongbridgeTerminal < Formula
  desc "AI-native CLI for Longbridge Securities — real-time market data, portfolio, and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"
  version "0.22.1"
  license "all_is_reserved"

  on_macos do
    on_arm do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.22.1/longbridge-terminal-darwin-arm64.tar.gz"
      sha256 "5f8a2b74bc55e2624183c61bdf18c635f8f8991c262f92f7be33907eb7ef12c4"
    end

    on_intel do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.22.1/longbridge-terminal-darwin-amd64.tar.gz"
      sha256 "4b4445c088e7a40517bbbb1a609426351c77c6ed23ab42d792b4c236005b390d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.22.1/longbridge-terminal-linux-arm64.tar.gz"
      sha256 "41dc3ba8bdd395cd6022f6dfe862e34b02da4fd5b7c24c74a5afb11d8271bc18"
    end

    on_intel do
      url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.22.1/longbridge-terminal-linux-amd64.tar.gz"
      sha256 "8e62bad91fe002da52b476290d1abb653beb8da1bb4d87a82b272e9f4e8d1dd8"
    end
  end

  def install
    bin.install "longbridge"
  end

  def caveats
    <<~EOS
      Get started by running:
        longbridge auth login
        longbridge --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/longbridge --version 2>&1", 0)
  end
end
