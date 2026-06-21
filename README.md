<!-- 
  META DESCRIPTION: DigiStrike - Digispark ATtiny85 BadUSB cybersecurity demonstration tool
  that silently dumps saved WiFi credentials via HID keyboard injection and exfiltrates them
  to Telegram or Discord in under 25 seconds. Built for college exhibitions and security awareness.
  Keywords: BadUSB, Digispark, ATtiny85, HID attack, WiFi credential dumper, cybersecurity,
  penetration testing, red team, Arduino, PowerShell payload, keyboard injection, USB attack,
  Discord webhook, Telegram bot exfiltration.
-->

<div align="center">

# ⚡ DigiStrike

### *BadUSB WiFi Credential Exfiltrator | Digispark ATtiny85*

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![Language](https://img.shields.io/badge/Language-Arduino%20%7C%20PowerShell-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue?style=for-the-badge)](LICENSE)
[![Category](https://img.shields.io/badge/Category-BadUSB%20%7C%20Red%20Team-red?style=for-the-badge&logo=hackthebox&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![Integration](https://img.shields.io/badge/Integration-Discord%20%7C%20Telegram-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![Cost](https://img.shields.io/badge/Hardware%20Cost-%3C%20₹300%20(~%243)-brightgreen?style=for-the-badge)](https://github.com/Esther7171/DigiStrike)

**Plug in. Register as keyboard. Dump credentials. Exfiltrate. Vanish. Execution time adjustable via script and optimized for any machine.**

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
- [Integration Options](#integration-options)
- [What Forensic Teams Can Trace](#what-forensic-teams-can-trace)
- [File Structure](#file-structure)
- [Disclaimer](#disclaimer)
- [License](#license)
- [Author](#author)

---

## What is Digispark / ATtiny85

The **Digispark** is a microcontroller board built around the **Atmel ATtiny85** chip. It is widely used in hardware security research, red team engagements and CTF competitions precisely because of one key property: the OS sees it as a keyboard, not a USB drive.

| Property | Detail |
|----------|--------|
| Disguise | Registers as HID keyboard. No USB storage ever appears |
| AV Bypass | No antivirus triggers, no USB device logs, no driver install |
| Cost | Under ₹300 (~$3 USD). Cheapest HID attack hardware available |
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
Step 04   Injects credentials as environment variables
Step 05   Pulls payload script from GitHub via iex + iwr
Step 06   Dumps all saved WiFi credentials using netsh wlan
Step 07   Sends the credentials to Telegram or Discord
Step 08   Deletes the temp file (randomized name each run)
Step 09   Clears PowerShell session history and PSReadLine buffer
Step 10   Wipes the Win+R MRU registry key
Step 11   Clears Windows Event Logs
Step 12   Exits PowerShell
Step 13   Zero traces left on the system
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
| 4 | Credential Injection | Set env vars for token or webhook | `0.4s` |
| 5 | Payload Execution | Download script, run it, exfiltrate | `15.0s` |
| 6 | Clean Exit | Type `exit`, close PowerShell | `0.5s` |
| | | **Total (plug to done)** | **`~23.9s`** |

Delays in the `.ino` file are fully adjustable. Increase them on slow machines or cut them down on fast ones.

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
| Windows Event Logs | `wevtutil cl` clears System, Security and Application logs |
| USB device logs | HID class devices produce no USB storage event log entries |
| Credentials in firmware | Token or webhook URL is typed live as env vars, never in the script |
| GitHub script | Neither `void.ps1` nor `null.ps1` contain any secrets |

After the device is unplugged, there is nothing left to find on the machine.

---

## How It Works

```
╔═════════════════════════════════════════════════════════════════╗
║                      DIGISTRIKE ATTACK FLOW                    ║
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
     │  token or webhook  │      │  iex(iwr payload)    │
     │  typed as keystrks │      │  downloaded live     │
     └────────────────────┘      └──────────┬───────────┘
                                            │
                  ┌─────────────────────────┘
                  ▼
     ┌────────────────────┐      ┌──────────────────────┐
     │  WIFI CREDS DUMPED │─────►│  SENT TO CHANNEL     │
     │  netsh wlan        │      │  Telegram or Discord │
     │  random tmp file   │      │  instant delivery    │
     └────────────────────┘      └──────────┬───────────┘
                                            │
                  ┌─────────────────────────┘
                  ▼
     ┌────────────────────┐      ┌──────────────────────┐
     │  TRACES DESTROYED  │─────►│  DONE                │
     │  temp file         │      │                      │
     │  PS history        │      │  Total: ~23.9s       │
     │  registry MRU      │      │  Zero artifacts      │
     │  event logs        │      │                      │
     └────────────────────┘      └──────────────────────┘

  [Digispark] → HID → [Windows] → Win+R → [PowerShell] → iex → [GitHub]
                                               │
                                        [netsh wlan] → [tmp file] → [Telegram or Discord 📱]
```

---

## Setup Guide

### Prerequisites

- Arduino IDE 1.8.x (recommended, 2.x has known upload timing issues with Digispark)
- A Digispark ATtiny85 board
- A Telegram bot or Discord webhook depending on which integration you use

---

### Step 1: Board Manager

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

### Step 2: DigiKeyboard Library

`DigiKeyboard.h` ships with the Digistump board package. No separate install needed.

If it is missing:
```
Sketch → Include Library → Manage Libraries → search "DigiKeyboard" → Install
```

---

### Step 3: Pick Your Integration

Choose the `.ino` that matches your exfiltration channel and open it in Arduino IDE.

| Channel | File to open |
|---------|-------------|
| Telegram | [digispark/telegram/r00t_b0t.ino](digispark/telegram/r00t_b0t.ino) |
| Discord | [digispark/discord/r00t_b0t.ino](digispark/discord/r00t_b0t.ino) |

Fill in your token or webhook URL where the placeholder says `PASTE_TOKEN_HERE`, `PASTE_CHAT_ID_HERE` or `PASTE_WEBHOOK_URL_HERE`. These values are typed as live keystrokes and never touch disk or GitHub.

See [Integration Options](#integration-options) for full setup steps for each channel.

---

### Step 4: Flash

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

The board is ready.

---

## Integration Options

DigiStrike supports two exfiltration channels. Pick one based on your setup.

---

### Telegram (void.ps1)

Best for personal use. Sends data directly to a Telegram bot.

| Step | Action |
|------|--------|
| 1 | Open Telegram and search @BotFather |
| 2 | Send /newbot and follow the prompts |
| 3 | Copy the API token |
| 4 | Create a group and add your bot |
| 5 | Get chat ID via @userinfobot |
| 6 | Open digispark/telegram/r00t_b0t.ino |
| 7 | Replace PASTE_TOKEN_HERE with your token |
| 8 | Replace PASTE_CHAT_ID_HERE with your chat ID |
| 9 | Flash to Digispark |

[scripts/void.ps1](scripts/void.ps1) is the payload. Host it on your GitHub as a public file.

---

### Discord Webhook (null.ps1)

Best for team monitoring or when Telegram is unavailable.

| Step | Action |
|------|--------|
| 1 | Open Discord and go to your server |
| 2 | Open channel Settings |
| 3 | Click Integrations then Webhooks |
| 4 | Click New Webhook and copy the URL |
| 5 | Open digispark/discord/r00t_b0t.ino |
| 6 | Replace PASTE_WEBHOOK_URL_HERE with your webhook URL |
| 7 | Flash to Digispark |

[scripts/null.ps1](scripts/null.ps1) is the payload. Host it on your GitHub as a public file.

---

## What Forensic Teams Can Trace

This section exists for educational awareness. Understanding what leaves traces is the foundation of defensive security.

### What the script clears

| Artifact | Method Used |
|----------|-------------|
| PowerShell session history | `Clear-History` |
| PSReadLine persistent buffer | `[PSConsoleReadLine]::ClearHistory()` |
| Win+R run dialog history | Registry `RunMRU` key deleted |
| Windows Event Logs | `wevtutil cl` on System, Security and Application |
| Temp file on disk | `Remove-Item -Force` with randomized filename |

### What remains traceable

| Trace | Why it persists |
|-------|----------------|
| Network traffic | HTTPS to Discord or Telegram is visible in router and ISP logs |
| Windows Prefetch | `powershell.exe` prefetch file in `C:\Windows\Prefetch\` is not cleared |
| GitHub access log | Your IP is logged when `raw.githubusercontent.com` is accessed |
| Discord or Telegram logs | Webhook and bot token are tied to your account. IP is stored server side |
| NTFS journal | MFT LogFile and UsnJrnl record file create and delete events |
| RAM and pagefile | Script content may persist in memory dumps or hibernation files |
| AMSI telemetry | Windows Defender may log script content before execution |

This tool is for demonstration on your own devices only. On a real forensic investigation the network layer alone is sufficient to identify the exfiltration destination.

---

## File Structure

```
DigiStrike/
├── README.md
├── LICENSE
├── digispark/
│   ├── telegram/
│   │   └── r00t_b0t.ino        ← Telegram version
│   └── discord/
│       └── r00t_b0t.ino        ← Discord version
└── scripts/
    ├── void.ps1                ← Telegram payload
    └── null.ps1                ← Discord payload
```

| File | Role |
|------|------|
| [digispark/telegram/r00t_b0t.ino](digispark/telegram/r00t_b0t.ino) | Injects Telegram bot token and chat ID, pulls void.ps1 |
| [digispark/discord/r00t_b0t.ino](digispark/discord/r00t_b0t.ino) | Injects Discord webhook URL, pulls null.ps1 |
| [scripts/void.ps1](scripts/void.ps1) | Dumps WiFi creds, sends via Telegram, cleans traces |
| [scripts/null.ps1](scripts/null.ps1) | Dumps WiFi creds, sends via Discord webhook, clears event logs |

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
