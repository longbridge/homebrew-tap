cask "longbridge-terminal" do
  version "0.28.2"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.2/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "7219b4b019a31d7dfed0f6f1f16d2356eb9acd58d30dd4c9d7477f9deec2add9"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.2/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "b6102fe9cc414b8cb87cce4e5a4fc476fbee6a02c40b55fc04328f7e94f5b4a2"
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
