cask "longbridge-terminal" do
  version "0.28.5"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.5/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "9b19260ce2daea808fb92c121af58b9687b8ff5710c44f9adc7af94a531bb3c8"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.5/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "bbe53b8dc02488e605840358fa2c3d75ca6d753a7aee193eb485a7b9d386afa0"
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
