cask "longbridge-terminal" do
  version "0.28.3"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.3/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "661cfd835c51fd564a9362938377e0f72704682f70f23189007d2899ff61d295"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.3/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "b38ceb5707c750b25565d5eb4f25bc657fd92d5aef92aca6dd23cb4f18b21b77"
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
