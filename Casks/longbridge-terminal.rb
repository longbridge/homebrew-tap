cask "longbridge-terminal" do
  version "0.8.4"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.4/longbridge-terminal-darwin-arm64.tar.gz"
                                                                                                                                sha256 "a1806f1fa64c08a4b799fc3baafce6ee00da584bc02996b8dd86a6465552db8b"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.4/longbridge-terminal-darwin-amd64.tar.gz"
                                                                                                                                sha256 "2bd840222c5a15f75928e597cd5d3f7f74115198cc51d2b4d39f22477df8716a"
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
