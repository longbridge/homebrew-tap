cask "longbridge-terminal" do
  version "0.28.6"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.6/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "063a3a55e612e5917d74a66220611276e7f08026c2addc05fc3d836c5d9a1842"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.6/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "2a6625cf6fec4bbf649e351a144f5ba0b0e9acab5728acbd870e676314e1e95e"
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
