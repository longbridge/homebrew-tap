cask "longbridge-terminal" do
  version "0.7.0"

  on_arm do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v#{version}/longbridge-terminal-darwin-arm64.tar.gz"
    sha256 "6c2b44586ea4c280e362b01023896808fdd2cbece6aa9c7654ac41b0d66bdd91"
  end

  on_intel do
    url "https://github.com/longbridge/longbridge-terminal/releases/download/v#{version}/longbridge-terminal-darwin-amd64.tar.gz"
    sha256 "f14e96c2cbf79c060a865a4f5d2ddac402d815319e9438ace7db31bb199c4986"
  end

  desc "Longbridge Terminal CLI for US and HK stock market data and trading"
  homepage "https://github.com/longbridge/longbridge-terminal"

  binary "longbridge"

  caveats <<~EOS
    Get started by running:
      longbridge -h
  EOS
end
