cask "longbridge-terminal" do
  version "0.8.5"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.5/longbridge-terminal-darwin-arm64.tar.gz"
                                                                                                                                                                                                                                                                sha256 "0349cb172c6da11c08abcbdddadbb57e91b376e53aed19838ac73f9bb2c9ed22"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.5/longbridge-terminal-darwin-amd64.tar.gz"
                                                                                                                                                                                                                                                                sha256 "27bbf919d725d3118392c02e56cf6c4a1c934094c2a0bc6cd9113156c1162061"
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
