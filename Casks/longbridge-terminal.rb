cask "longbridge-terminal" do
  version "0.8.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.0/longbridge-terminal-darwin-arm64.tar.gz"
        sha256 "e1fd2a73010f7217e2857bf95baae81e3193f14168249b9f8c64c457906e6a38"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.0/longbridge-terminal-darwin-amd64.tar.gz"
        sha256 "483a608394fcf3b813701a24a2325d104df1da425bd4d970d0207b902b26a352"
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
