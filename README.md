# Migraine Relief Scripts

Quick scripts to optimize your computer settings when you have a migraine. Available for both Windows and Mac!

## What it does

### `migraine-mode.sh` activates:
- ⬇️ Reduces screen brightness to 20%
- 🌑 Enables dark mode throughout Windows
- 🔕 Enables Focus Assist (reduces notifications)
- 🔇 Mutes system volume
- 🌅 Enables Night Light (reduces blue light)
- ❌ Closes distracting apps (Teams, Slack, Discord, Spotify)

### `migraine-extra.sh` activates (all of above PLUS):
- 🔍 Increases display zoom to 150% (may require logout)

### `restore-normal.sh` restores:
- ⬆️ Screen brightness to 80%
- ☀️ Light mode (optional - can be disabled in script)
- 🔔 Normal notifications
- 🔊 System volume
- 🌞 Disables Night Light
- 🔍 Display zoom to 100%

### `notify-team.sh` sends notifications:
- 📧 Sends email to manager and backup person
- 💼 Helps compose Teams messages
- ⚠️ Requires configuration (see below)

## Usage

### Windows (from WSL/Linux terminal):
```bash
# Notify your team first (if leaving work)
./notify-team.sh

# For regular migraine
./migraine-mode.sh

# For bad migraine (includes zoom increase)
./migraine-extra.sh

# When feeling better
./restore-normal.sh
```

### Mac (from Terminal):
```bash
# Notify your team first (if leaving work)
./notify-team-mac.sh

# For regular migraine
./migraine-mode-mac.sh

# For bad migraine (includes zoom increase)
./migraine-extra-mac.sh

# When feeling better
./restore-normal-mac.sh
```

## Getting Started

### For Windows Users:
1. Clone this repository to your WSL/Linux environment
2. Make scripts executable: `chmod +x *.sh`
3. Run the scripts from your WSL terminal

**Optional - Create Windows Desktop Shortcuts:**
1. Right-click on your desktop → New → Shortcut
2. Enter location: `wsl.exe bash -c "cd ~/migraine-script && ./migraine-mode.sh; read -p 'Press Enter to close'"`
3. Name it "Migraine Mode"
4. Repeat for restore-normal.sh

### For Mac Users:
1. Clone this repository: `git clone https://github.com/SophCarp/migraine-script.git`
2. Navigate to the folder: `cd migraine-script`
3. Make scripts executable: `chmod +x *-mac.sh`
4. Run the Mac scripts (those ending in `-mac.sh`)

**Note for Mac:** Some features may require accessibility permissions:
- Go to System Settings → Privacy & Security → Accessibility
- Grant Terminal access when prompted

## Customization

### Configure team notifications
Edit `notify-team.sh` (Windows) or `notify-team-mac.sh` (Mac) and update:
- `MANAGER_EMAIL` - Your manager's email
- `BACKUP_PERSON_EMAIL` - Colleague to CC
- `MESSAGE` - Your out-of-office message

### Adjust migraine mode settings
Edit the appropriate script for your OS:
- **Windows:** `migraine-mode.sh`, `migraine-extra.sh`, `restore-normal.sh`
- **Mac:** `migraine-mode-mac.sh`, `migraine-extra-mac.sh`, `restore-normal-mac.sh`

You can customize:
- Brightness levels (default: 20% for migraine, 80% for normal)
- Display zoom (default: 150% for migraine, 100% for normal)
- Which apps to close
- Whether to restore light mode or stay in dark mode

## Tips

- Keep water nearby
- Use with medication as prescribed
- Rest in a quiet, dark room
- Consider blue light filtering glasses

Take care of yourself! 💙
