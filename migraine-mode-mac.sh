#!/bin/bash

echo "🌙 Activating Migraine Relief Mode (Mac)..."
echo ""

# 1. Reduce screen brightness to minimum
echo "⬇️  Reducing screen brightness..."
osascript -e 'tell application "System Events" to key code 107' # F1 brightness down
osascript -e 'tell application "System Events" to key code 107'
osascript -e 'tell application "System Events" to key code 107'
osascript -e 'tell application "System Events" to key code 107'
osascript -e 'tell application "System Events" to key code 107'

# 2. Enable macOS dark mode
echo "🌑 Enabling dark mode..."
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# 3. Enable Do Not Disturb
echo "🔕 Enabling Do Not Disturb..."
# macOS Ventura and later
shortcuts run "Set Focus" &>/dev/null || \
# macOS Monterey and earlier
osascript -e 'tell application "System Events" to keystroke "N" using {command down, shift down, option down, control down}' 2>/dev/null

# 4. Mute system volume
echo "🔇 Muting system volume..."
osascript -e "set volume output muted true"

# 5. Enable Night Shift (reduces blue light)
echo "🌅 Enabling Night Shift..."
# This requires manual setup in System Preferences, but we can try to enable it
defaults write com.apple.CoreBrightness "CBBlueReductionStatus" -dict-add "AutoBlueReductionEnabled" -bool true
defaults write com.apple.CoreBrightness "CBBlueReductionStatus" -dict-add "BlueReductionEnabled" -bool true
killall cfprefsd 2>/dev/null

# 6. Close common distracting applications
echo "❌ Closing potentially distracting apps..."
for app in "Slack" "Microsoft Teams" "Discord" "Spotify" "Mail" "Messages"; do
    osascript -e "quit app \"$app\"" 2>/dev/null
done

# 7. Set a calm reminder
echo ""
echo "✅ Migraine mode activated!"
echo ""
echo "💙 Remember to:"
echo "   • Rest in a dark, quiet room"
echo "   • Stay hydrated"
echo "   • Take your medication if needed"
echo "   • Close your eyes and breathe deeply"
echo ""
echo "Run './restore-normal-mac.sh' when you're feeling better"
