# TP-Link Router CLI

<div align="center">

<img src="https://upload.wikimedia.org/wikipedia/commons/e/e0/TP-Link_logo_2016.svg" alt="TP-Link Official Logo" width="180" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://cdn.jsdelivr.net/npm/simple-icons@v14/icons/gnubash.svg" alt="Terminal CLI" width="65" />
<br><br>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org/)
[![npm package](https://img.shields.io/badge/npm-tplink--router--cli-red.svg)](https://www.npmjs.com/)
[![Homebrew](https://img.shields.io/badge/Homebrew-Formula-orange.svg)](Formula/tplink-cli.rb)
[![Debian package](https://img.shields.io/badge/Debian-APT%20.deb-purple.svg)](debian/)
[![Platform: Linux | macOS | Windows](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-brightgreen.svg)](https://github.com/dulithdivisekara/tplink-cli)
[![Author: Dulith Divisekara](https://img.shields.io/badge/Author-Dulith%20Divisekara%20(SLIIT)-orange.svg)](https://github.com/dulithdivisekara)

**Production-Grade, Universal Command-Line Suite & Network Optimizer for TP-Link Routers.**<br>
Engineered for human power-users and system administrators with single-admin atomic leasing, multi-environment network safety, cellular tower locking, and host-side TCP BBR optimization.

</div>

---

## 👨‍💻 Author & Origin Story

> **Created & Architected by:** [Dulith Divisekara](https://github.com/dulithdivisekara)  
> *Undergraduate in Information Technology, Sri Lanka Institute of Information Technology (SLIIT), Malabe, Sri Lanka.*

### Origin: Taming Hutch 4G in Malabe, Sri Lanka
Conceived and built in **Malabe, Sri Lanka (near the SLIIT Campus area)** to solve connection drops, high bufferbloat, and base station cell flapping on a **Hutch 4G LTE unlimited 20 Mbps SIM** running in a **TP-Link Archer MR200 v5** router.

As a student frequently transitioning between **SLIIT Campus Wi-Fi**, **personal mobile hotspot**, and the **boarding router**, this CLI features a built-in **Network Guard** ensuring router commands are *never* run when connected to public or campus networks.

---

## 🚀 Installation Across Package Managers ($0 Cost)

Choose your preferred package manager:

### 1. npm / npx (Global CLI)
```bash
npm install -g tplink-router-cli
# Or run on-demand:
npx tplink-router-cli status
```

### 2. Python PyPI (pip / uv / pipx)
```bash
pip install tplink-cli
# Or using pipx:
pipx run tplink-cli status
```

### 3. Homebrew (macOS & Linux)
```bash
brew tap dulithdivisekara/tap
brew install tplink-cli
```

### 4. Debian / Ubuntu (APT `.deb`)
```bash
curl -fsSLO https://github.com/dulithdivisekara/tplink-cli/releases/latest/download/tplink-cli_all.deb
sudo dpkg -i tplink-cli_all.deb
```

### 5. Universal Zero-Dependency POSIX Installer (`curl | bash`)
```bash
curl -fsSL https://raw.githubusercontent.com/dulithdivisekara/tplink-cli/main/install.sh | bash
```

### 6. Go (`go install`)
```bash
go install github.com/dulithdivisekara/tplink-cli/cmd/tplink-cli@latest
```

### 7. Ruby Gem
```bash
gem install tplink-cli
```

---

## ⚙️ Configuration & Credentials

Store your router credentials securely with owner-only (`0600`) POSIX permissions:

```bash
# 1. Save router password securely:
tplink-cli config set-password "your_admin_password"

# 2. (Recommended) Guard against university/campus Wi-Fi:
tplink-cli config set-password "your_admin_password" --expected-ssid "dulith.connect"

# 3. View configuration status:
tplink-cli config show
```

---

## 🛠️ Complete CLI Command Reference (18 Commands)

```bash
# 1. General Telemetry & Live Radio
tplink-cli status                         # Show full device, cellular, and WAN telemetry
tplink-cli status --json                  # Output machine-readable JSON
tplink-cli signal                         # Show live RSRP, RSRQ, SNR, and antenna ratings
tplink-cli profile check                  # Verify active Wi-Fi SSID and Gateway safety

# 2. Cellular & 4G Optimization
tplink-cli cell-lock                      # View current Cell Lock status
tplink-cli cell-lock --enable --earfcn 1550 --pci 58  # Lock to specific LTE tower
tplink-cli cell-lock --disable            # Restore automatic roaming
tplink-cli band 3                         # Lock modem to LTE Band 3 (1800 MHz)
tplink-cli band auto                      # Restore automatic LTE band selection
tplink-cli data-limit                     # Show monthly cellular quota & live bandwidth
tplink-cli data-limit --limit 50000 --day 15  # Set 50GB monthly cap resetting on 15th

# 3. Connected Devices & LAN
tplink-cli clients                        # Display table of connected devices (IP, MAC, Hostname)
tplink-cli reservation list               # List static DHCP IP address reservations
tplink-cli reservation add AA:BB:CC:DD:EE:FF 192.168.1.50   # Add static reservation
tplink-cli reservation del AA:BB:CC:DD:EE:FF               # Remove static reservation

# 4. Wireless & Hardware Management
tplink-cli wifi                           # Show 2.4 GHz and 5 GHz Wi-Fi radio status
tplink-cli wifi --band 5GHz --toggle off  # Disable 5 GHz radio
tplink-cli leds                           # Check router front-panel LED night mode status
tplink-cli leds --night-mode on --start 23:00 --end 07:00   # Auto-disable LEDs at night

# 5. Networking & System Tools
tplink-cli dns set 8.8.8.8 8.8.4.4        # Set low-latency DNS (avoiding Cloudflare loss on Hutch)
tplink-cli ipv6 off                       # Disable IPv6 stack (mitigate dual-stack delays)
tplink-cli diag                           # Run router WAN & internet reachability test
tplink-cli reboot                         # Gracefully reboot the router
tplink-cli ussd "*344#"                   # Send interactive USSD balance inquiry
tplink-cli sms list --limit 10            # Read SIM SMS inbox
tplink-cli sms send 078xxxxxxx "Hello!"   # Send SMS message

# 6. Interactive REPL
tplink-cli repl                           # Launch interactive console holding open session
```

---

## ⚡ Host-Side Network Optimizer (Linux)

```bash
# Apply TCP BBR congestion control, Fair Queueing (FQ), and MTU 1420 GTP clamping:
sudo ./scripts/optimize-network.sh enable

# Check current network parameters & latency:
./scripts/optimize-network.sh status

# Revert to standard system defaults:
sudo ./scripts/optimize-network.sh disable
```

### 28-Byte Cellular Keepalive Pulse
Keeps the cellular modem in active `RRC_CONNECTED` state, removing radio wake-up latency (< 0.5 KB/min data consumption):

```bash
./scripts/keepalive-pulse.sh start
./scripts/keepalive-pulse.sh status
./scripts/keepalive-pulse.sh stop
```

---

## 🧪 Testing

```bash
python3 -m unittest discover tests
```

---

## 📄 License

MIT License. Created by [Dulith Divisekara](https://github.com/dulithdivisekara).
