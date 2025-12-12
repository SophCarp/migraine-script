# Migraine Relief Scripts

Quick scripts to optimize your Windows computer settings when you have a migraine.

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

### From WSL/Linux terminal:
```bash
# Notify your team first (if leaving work)
notify-team

# For regular migraine
migraine

# For bad migraine (includes zoom increase)
migraine-extra

# When feeling better
restore-normal
```

### From Windows (create shortcuts):
1. Right-click on your desktop → New → Shortcut
2. Enter location: `wsl.exe bash -c "cd ~/testing/migraine && ./migraine-mode.sh; read -p 'Press Enter to close'"`
3. Name it "Migraine Mode"
4. Repeat for restore-normal.sh

## Making scripts executable

```bash
chmod +x migraine-mode.sh restore-normal.sh
```

## Customization

### Configure team notifications
Edit `notify-team.sh` and update:
- `MANAGER_EMAIL` - Your manager's email
- `BACKUP_PERSON_EMAIL` - Colleague to CC
- `MESSAGE` - Your out-of-office message

### Adjust migraine mode settings
Edit `migraine-mode.sh` to adjust:
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
