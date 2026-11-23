cask "longbridge-terminal" do
  version "0.32.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.32.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "19800158220e2aa4ff055c9b9f3295546e3c0cc15e4d55b114ed7b5c9c0b58a6"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.32.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "37259aac4a5d8f174731159f88ee2c6f76d552c94aabe9333a934b561e7bca00"
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
