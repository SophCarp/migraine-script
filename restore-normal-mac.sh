#!/bin/bash

echo "☀️  Restoring Normal Mode (Mac)..."
echo ""

# 1. Restore screen brightness
echo "⬆️  Restoring screen brightness..."
osascript -e 'tell application "System Events" to key code 106' # F2 brightness up
osascript -e 'tell application "System Events" to key code 106'
osascript -e 'tell application "System Events" to key code 106'
osascript -e 'tell application "System Events" to key code 106'
osascript -e 'tell application "System Events" to key code 106'
osascript -e 'tell application "System Events" to key code 106'
osascript -e 'tell application "System Events" to key code 106'

# 2. Restore light mode (optional - comment out if you prefer dark mode)
echo "☀️  Restoring light theme..."
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'

# 3. Disable Do Not Disturb
echo "🔔 Disabling Do Not Disturb..."
shortcuts run "Turn Off Focus" &>/dev/null || \
osascript -e 'tell application "System Events" to keystroke "N" using {command down, shift down, option down, control down}' 2>/dev/null

# 4. Unmute system volume (set to 50%)
echo "🔊 Restoring system volume..."
osascript -e "set volume output muted false"
osascript -e "set volume output volume 50"

# 5. Disable Night Shift
echo "🌞 Disabling Night Shift..."
defaults write com.apple.CoreBrightness "CBBlueReductionStatus" -dict-add "BlueReductionEnabled" -bool false
killall cfprefsd 2>/dev/null

# 6. Restore display zoom (requires manual adjustment in most cases)
echo "🔍 Restoring display zoom..."
echo "   ℹ️  Please manually reset zoom in System Settings > Displays if needed"

echo ""
echo "✅ Normal mode restored!"
echo "💚 Hope you're feeling better!"
