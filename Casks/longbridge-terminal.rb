cask "longbridge-terminal" do
  version "0.8.1"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.1/longbridge-terminal-darwin-arm64.tar.gz"
                sha256 "a335c8381643170ea6af3eaf3dded0948c995798858475bf1037077dd4baaee8"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.8.1/longbridge-terminal-darwin-amd64.tar.gz"
                sha256 "d400adec64620158e0ba5010092d48c8f9f970ec3870dba456755d4af01c3ee1"
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
