# DigiStrike ⚡

> A Digispark ATtiny85 based HID BadUSB payload 
> for cybersecurity education and exhibitions.

![Platform](https://img.shields.io/badge/Platform-Digispark%20ATtiny85-blue)
![Language](https://img.shields.io/badge/Language-Arduino%20C-orange)
![License](https://img.shields.io/badge/License-BSD%203--Clause-green)
![Author](https://img.shields.io/badge/Author-Esther7171-red)

---

## ⚠️ Disclaimer

> This project is strictly for **educational purposes**
> and **cybersecurity awareness demonstrations only**.
> Use only on devices you **own** or have **explicit 
> written permission** to test on.
> The author is **not responsible** for any misuse,
> damage or illegal activity caused by this tool.

---

## What Is DigiStrike?

DigiStrike turns a **Digispark ATtiny85** into a 
BadUSB device. When plugged into a target PC it:

- Registers as a **HID Keyboard** (not USB storage)
- Opens PowerShell silently
- Pulls payload script from GitHub
- Executes and **self destructs**
- Leaves **zero traces** behind

---

## Hardware Required

| Item | Details |
|------|---------|
| Digispark ATtiny85 | Main board |
| USB port | On target PC |
| Telegram Bot | For receiving data |

---

## Arduino IDE Setup Guide

### Step 1 — Install Arduino IDE
```
Download from:
https://www.arduino.cc/en/software
Version 2.x recommended
```

### Step 2 — Add Digispark Board
```
Open Arduino IDE
File → Preferences
Additional Board Manager URLs → paste:
http://digistump.com/package_digistump_index.json
Click OK
```

### Step 3 — Install Board Package
```
Tools → Board → Board Manager
Search: Digistump AVR
Install: Digistump AVR Boards
Wait for install to complete
```

### Step 4 — Install DigiKeyboard Library
```
Tools → Manage Libraries
Search: DigisparkKeyboard
Install it
```

### Step 5 — Select Board
```
Tools → Board → Digistump AVR Boards
Select: Digispark Default 16.5mhz
DO NOT select a port
Digispark does not need port selection
```

### Step 6 — Flash Code
```
1. Open r00t_b0t.ino in Arduino IDE
2. Replace PASTE_TOKEN_HERE with bot token
3. Click Upload (Ctrl+U)
4. Wait for message:
   "Plug in device now..."
5. ONLY THEN plug in Digispark
6. Wait for "Micronucleus done. Thank you!"
```

---

## 🤖 Telegram Bot Setup

```
1. Open Telegram
2. Search @BotFather
3. Send /newbot
4. Choose name: r00t_b0t
5. Choose username: r00t_b0t_bot
6. Copy API token
7. Create a group
8. Add bot to group
9. Get group chat ID
10. Paste token in Digispark code
```

---

## 📁 Project Structure

```
DigiStrike/
├── README.md
├── LICENSE
├── digispark/
│   └── r00t_b0t.ino    ← Flash to Digispark
└── scripts/
    └── r00t.ps1         ← Host on GitHub
```

---

## ⚡ How To Use

```
1. Host r00t.ps1 on your GitHub (public repo)
2. Flash r00t_b0t.ino to Digispark
3. Plug into target PC
4. Wait ~20 seconds
5. Check Telegram group
6. WiFi passwords appear!
```

---

## 🔒 Zero Trace Features

```
✅ Registers as HID keyboard
✅ No USB storage detected
✅ Clears PowerShell history
✅ Clears Win+R run history
✅ Deletes temp files
✅ Random temp filename
✅ Token stored in chip only
✅ GitHub script has no secrets
```

---

## 🛠️ Built With

- Arduino IDE 2.x
- Digispark ATtiny85
- DigiKeyboard Library
- PowerShell
- Telegram Bot API
- curl.exe

---

## 📜 License

BSD 3-Clause License
Copyright (c) 2026 Esther7171
See LICENSE file for details

---

## 👤 Author

**Esther7171**
- GitHub: [@Esther7171](https://github.com/Esther7171)
- Project: [DeathEsther ESP8266 Deauther](https://github.com/Esther7171)

---

> ⭐ Star this repo if you found it useful!
```

---

## Repo Structure On GitHub

```
Create repo: DigiStrike
Add files:
├── README.md     ← paste above
├── LICENSE       ← BSD 3 clause
├── digispark/
│   └── r00t_b0t.ino
└── scripts/
    └── r00t.ps1
```

Create repo and share link! 🎯🔥
