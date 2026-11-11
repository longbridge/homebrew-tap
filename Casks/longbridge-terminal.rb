cask "longbridge-terminal" do
  version "0.31.2"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.31.2/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "d6e06c64f637aa98240b9e0e0cf3614187fbffa15046d58887eb76ba65be6560"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.31.2/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "a21d3feffab7490b04a4fb37c03b11c47103e232a0f9eefbc24e76d953000e79"
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
