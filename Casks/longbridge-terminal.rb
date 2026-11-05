cask "longbridge-terminal" do
  version "0.31.1"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.31.1/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "a2a9d334f570e050f2fe643ded69a5d9a5769ec229d1de7e6e4668ce5899665c"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.31.1/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "f2e0b6ef9292e024816cf450691b70a545c0d35b3e5105331464f640365875e3"
  end

  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"

  binary "longbridge"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
  end

  caveats <<~EOS
    Get started by running:
      longbridge -h
  EOS
end
