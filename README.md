# Longbridge Homebrew Tap

Official [Homebrew](https://brew.sh) tap for [Longbridge](https://longbridge.com) tools.

## Install

Longbridge Terminal:

```bash
brew install --cask longbridge/tap/longbridge-terminal
```

NSH (Apple silicon macOS or x86_64 Linux):

```bash
brew install longbridge/tap/nsh
nsh --version
```

Intel Macs and ARM Linux need a [source build](https://nsh.dev/docs/installation#building-from-a-checkout).
Native macOS apps require macOS 14 or newer; the prebuilt Linux runtime requires
glibc 2.39 and GTK 4.14 or newer. See [NSH's platform tools](https://nsh.dev/docs/installation#platform-tools)
for the tools needed to develop and package apps for each target.

## Usage

```bash
longbridge -h
```

## Packages

| Package | Type | Description |
|---------|------|-------------|
| `longbridge-terminal` | Cask | Longbridge Terminal CLI for US and HK stock market data and trading |
| `nsh` | Formula | Native UI from TSX modules, with prebuilt runtimes |

## Update

```bash
brew upgrade --cask longbridge-terminal
```
