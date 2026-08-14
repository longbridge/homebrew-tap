cask "longbridge-terminal" do
  version "0.27.1"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.27.1/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "52b540cd00b40d29782be78e05a1e1a1a4c1ac19773d7d152ceeaf36ac197508"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.27.1/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "36c26ad056273114142e157ac80cc84c472284222ece926f67f66f2a3663b9f8"
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
