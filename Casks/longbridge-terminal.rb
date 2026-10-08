cask "longbridge-terminal" do
  version "0.29.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.29.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "d0c94bdfb9a78398309f58b4be7ada25a6388bdd8ff8b7fcf72f1d8390b7dcf6"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.29.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "6831127642381e54665191c40adfc904ff5375a880e0d0b1348d39d6e5ab35b6"
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
