# SHELLS

A collection of shell utilities, alias files, and automation scripts for Linux, macOS, and WSL environments — plus a real-time stock and crypto price monitor built on the Nasdaq API.

---

## Contents

- [Stock Monitor](#stock-monitor)
- [Alias Files](#alias-files)
- [Docker Utilities](#docker-utilities)
- [Media Conversion](#media-conversion)
- [Git Helpers](#git-helpers)
- [System Utilities](#system-utilities)
- [Cross-Compilation & Embedded](#cross-compilation--embedded)
- [Setup Scripts](#setup-scripts)

---

## Stock Monitor

**`stock`** — A terminal-based real-time stock and crypto price monitor.

### Features

- Pulls live prices from the **Nasdaq API** (stocks) and **Yahoo Finance** (day high/low, crypto)
- **Pre-market** and **after-hours** prices automatically populated via Nasdaq's extended-trading endpoint
- **Dynamic price targets** fetched from Nasdaq at startup:
  - `TARGET_HIGH` — 1-year analyst consensus target
  - `TARGET_LOW` — 52-week low price
- **Alert** triggered when the active price hits either target
- Parallel data fetching via `ThreadPoolExecutor` for fast refresh
- Color-coded table: green (up), red (down), magenta (extended hours), red background (alert)
- **BTC** included in the default watchlist with proper crypto routing

### Default watchlist

`INBS · LULU · OKLO · COIN · CRCL · MSTR · ARM · AMD · NVDA · MSFT · BTC`

### Usage

```bash
# Built-in watchlist
./stock

# Append extra stocks
./stock AAPL TSLA
./stock --tickers AAPL TSLA
./stock -t AAPL TSLA

# Append crypto tickers
./stock --crypto ETH SOL
./stock -c ETH SOL

# Replace the default list entirely
./stock --only AAPL TSLA
./stock --only --crypto ETH SOL

# Mix
./stock -t AAPL -c ETH --only

# Show help
./stock --help
```

### Output columns

| Column | Description |
|---|---|
| `SYMBOL` | Ticker |
| `PRICE` | Last sale price (regular session) |
| `PREV_CLOSE` | Previous session close |
| `CHANGE_%` | Percentage change vs previous close |
| `HIT_TARGET` | `True` when price breaches either target |
| `DAY_HIGH` | Intraday high (Yahoo Finance) |
| `VOLUME` | Share volume |
| `EXT_PRICE` | Pre-market or after-hours price |
| `SESSION` | `Regular` / `Pre-Market` / `After Hours` |
| `TARGET_LOW` | 52-week low (Nasdaq) |
| `TARGET_HIGH` | 1-year analyst target (Nasdaq) |
| `ALERT` | `SELL ALERT` message when target is hit |

### Requirements

Python 3.8+ — no third-party packages required (uses only stdlib).

---

## Alias Files

Ready-to-source alias and environment files for different platforms. Copy or symlink the relevant file into your shell config (`~/.bashrc`, `~/.zshrc`, etc.).

| File | Platform |
|---|---|
| [`bash_aliases`](bash_aliases) | Ubuntu / Debian desktop |
| [`bash_aliases_devnode`](bash_aliases_devnode) | Remote Linux dev node |
| [`bash_aliases_mac`](bash_aliases_mac) | macOS |
| [`bash_aliases_wsl`](bash_aliases_wsl) | Windows Subsystem for Linux |
| [`zsh_aliases`](zsh_aliases) | Zsh (any platform) |

All credential and hostname fields have been replaced with `YOUR_*` placeholders — fill them in for your environment.

---

## Docker Utilities

| Script | Description |
|---|---|
| [`docker-run`](docker-run) | Run a Docker image with X11 display forwarding and optional GPU/USB access |
| [`docker_cpu`](docker_cpu) | CPU-only Docker run with display forwarding |
| [`docker_mac`](docker_mac) | macOS Docker run helper |
| [`docker-none-ridder`](docker-none-ridder) | Remove all dangling (`<none>`) Docker images |

### Example — `docker-run`

```bash
./docker-run          # interactive with display
./docker-run --gpu    # enable GPU passthrough
./docker-run --usb    # enable USB privileged mode
```

---

## Media Conversion

FFmpeg-based helpers for common video/image conversion tasks.

| Script | Description |
|---|---|
| [`ogv2mp4`](ogv2mp4) | Convert OGV → MP4 |
| [`wmv2mp4`](wmv2mp4) | Batch convert WMV → MP4 (H.264 + AAC) |
| [`cut_trim.sh`](cut_trim.sh) | Speed up and trim a video to a specified duration |
| [`compresspdf`](compresspdf) | Compress a PDF using Ghostscript |
| [`gimpfu`](gimpfu) | Batch convert GIMP XCF files → PNG/JPG |

---

## Git Helpers

| Script | Description |
|---|---|
| [`gitci`](gitci) | Back up / commit all local git repos in one pass |
| [`gitsetup`](gitsetup) | Bootstrap global git config (name, email, editor, credential cache) |
| [`commit`](commit) | Clean LaTeX build artefacts then commit |
| [`clone_monitor`](clone_monitor) | Monitor progress of a `dd` disk clone in the terminal |

### `gitsetup`

Edit the placeholders before running:

```bash
# Fill in your details first
vim gitsetup
./gitsetup
```

---

## System Utilities

| Script | Description |
|---|---|
| [`progkill`](progkill) | Kill a process by name with optional signal |
| [`usbreset`](usbreset) | Reset a USB device by path (compiled binary) |
| [`replace_string`](replace_string) | Recursive in-place string replacement across files |
| [`shcp`](shcp) | Copy shell scripts to multiple remote hosts via SSH |
| [`hdd_to_hdd_cp`](hdd_to_hdd_cp) | Full disk clone from `/dev/sda` → `/dev/sdb` using `cat` |
| [`clean`](clean) | Remove LaTeX auxiliary files (`.aux`, `.log`, `.out`, etc.) |

### `progkill`

```bash
./progkill firefox          # SIGTERM
./progkill -9 firefox       # SIGKILL
```

### `replace_string`

```bash
./replace_string old_text new_text path/to/dir
```

---

## Cross-Compilation & Embedded

| Script | Description |
|---|---|
| [`cross_compile.sh`](cross_compile.sh) | Cross-compile a project for ARM/embedded targets |
| [`cross_compile_deps.sh`](cross_compile_deps.sh) | Install cross-compilation toolchain dependencies |
| [`remotely_deploy_embedded.sh`](remotely_deploy_embedded.sh) | Deploy a compiled binary to a remote embedded device over SSH |

---

## Setup Scripts

| Script | Description |
|---|---|
| [`packages`](packages) | Install a curated set of packages on Ubuntu 14.04+ |
| [`mac_dev_setup.sh`](mac_dev_setup.sh) | Bootstrap a macOS development environment |
| [`gconfig`](gconfig) | Set default `gcc`/`g++` via `update-alternatives` |
| [`get-docker.sh`](get-docker.sh) | Install Docker Engine on Ubuntu |
| [`vpn.sh`](vpn.sh) | Build and install OpenConnect VPN from source |
| [`blobfuse_cfg.yaml`](blobfuse_cfg.yaml) | BlobFuse2 config template for mounting Azure Blob Storage |
| [`ssh_config`](ssh_config) | SSH client config template (jump hosts, tunnels, multiplexing) |
| [`sofa-cmake.sh`](sofa-cmake.sh) | Build the SOFA simulation framework from source |
| [`opencv3`](opencv3) | Build OpenCV 3 from source with CUDA support |
| [`glfw_osx`](glfw_osx) | Build GLFW on macOS |

### Azure Blob Storage (BlobFuse2)

Fill in your storage account details in [`blobfuse_cfg.yaml`](blobfuse_cfg.yaml), then mount with:

```bash
blobfuse2 mount /mnt/azstorage --config-file=~/blobfuse_cfg.yaml
```

### SSH config

Copy [`ssh_config`](ssh_config) to `~/.ssh/config` and replace the `YOUR_*` placeholders with your hostnames and username.

---

## Contributing

PRs and issues welcome. Scripts are intentionally minimal and dependency-free where possible.

---

## License

MIT
