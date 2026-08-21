cask "longbridge-terminal" do
  version "0.28.1"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.1/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "674288b77981ea4572d2b92aba321895ee01f2b49e9583fadbd3f1a96d8953d3"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.1/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "f85fbab0705222d3f397d528085c105cc247e5aba27886eb6400f4f441686e38"
  end

  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"

  binary "longbridge"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", staged_path]
  end

  caveats <<~EOS
    Get started by running:
      longbridge -h
  EOS
end
