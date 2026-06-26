cask "longbridge-terminal" do
  version "0.24.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.24.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "1e104d0eb993a853830a4839d2b634b57fcda9b6365fd8f2ca23dd17e11e3672"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.24.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "4ee9996d5b093e39bac83fa07f97e3354dd1531c7b421cc5b25f1282c833900e"
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
