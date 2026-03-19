cask "longbridge-terminal" do
  version "0.8.2"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.2/longbridge-terminal-darwin-arm64.tar.gz"
                                sha256 "48b887bb4ed443e029811f0f1b038f0f5961023561a0bb05ab0f140d474d718a"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.2/longbridge-terminal-darwin-amd64.tar.gz"
                                sha256 "a2d5be0f5a81a7297953dd411f6f4ad8fcc62911e11fe77aeb08b2867511aa0e"
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
