cask "longbridge-terminal" do
  version "0.27.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.27.0/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "a02efda64aa72bf65c3e3caea3466f69d3ecb42a3f4dd965602438e0c9ccfe82"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v0.27.0/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "66421942119c9fc2bdc67d1f794ea0da6fd2feb1ed7252ec167b5ab6c3ee76f8"
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
