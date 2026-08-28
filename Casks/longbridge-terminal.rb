cask "longbridge-terminal" do
  version "0.28.4"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.4/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "8bc1a00cc8bf0103fa5baae6d71e01ea66c048864bf6c22bb224c877441df500"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.4/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "4f4a850e8101259e222f05f6a7bdf72f8e97cdbc0fc6cf4bace69759d98b655b"
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
