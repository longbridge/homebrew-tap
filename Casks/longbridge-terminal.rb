cask "longbridge-terminal" do
  version "0.28.3"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.3/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "bca5924afea459542779c8261b7efcd64a648cd54b29b1e24818dccfc604a571"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.3/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "fbd5f0b5b6c73a0ef9654ea6c45bbc3f371ecc6fc9c3509d8b4a7f597b9360a6"
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
