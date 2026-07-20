cask "longbridge-terminal" do
  version "0.25.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.25.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "7e9a9b77df21bbabce0b48f041cbe23f788360efa1bd280ba5419a8cff4497c8"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.25.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "214a75061d342777ddf3ea08e19bdf064c8c8bc8f465d1f358d19c0c1cfd5d28"
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
