cask "longbridge-terminal" do
  version "0.28.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "9dfa7ca50743c16d4ec6726de1df6cd76eb10fdcc40dbbee43c41f2495d0fb07"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "9cfdd12deeff9c62dc8c56cdc2656bd1fe607943d5c7e8f08a58dafc4d9da336"
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
