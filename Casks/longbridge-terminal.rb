cask "longbridge-terminal" do
  version "0.28.7"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.7/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "2e723e1f1a2864cf01a8369dfffb68a4cf59c9382b847a89893c033c43bb72ac"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.28.7/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "4c446ed8fb7e0d5da7463a6fb07ed587e9a03be5e77f6965b269b9bf89cf2920"
  end

  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"

  binary "longbridge"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          ".",
        writable_paths: ["."],
        must_succeed:   false
  end

  caveats <<~EOS
    Get started by running:
      longbridge -h
  EOS
end
