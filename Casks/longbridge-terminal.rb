cask "longbridge-terminal" do
  version "0.8.3"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.3/longbridge-terminal-darwin-arm64.tar.gz"
                                                                sha256 "42afb46d9d36bcf8d982a39874f520ac6c6c0231778a4620b65a261b74dcb0de"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.3/longbridge-terminal-darwin-amd64.tar.gz"
                                                                sha256 "c95ef02053162aed12b7d01abc1940d66c39de71aacfc97bc1b6cce27f251a6c"
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
