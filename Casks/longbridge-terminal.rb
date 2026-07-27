cask "longbridge-terminal" do
  version "0.26.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.26.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "c6f4cbabf3d7c9ac196cd6a1dbd2c8751dcf44e2f3880ee8a34e72451604dfaa"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.26.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "6670168fdbbdb4d9dc88d5f0a0a4286e9c10e2667e04e3231571cbc261d0f8af"
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
