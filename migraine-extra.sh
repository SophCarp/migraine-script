#!/bin/bash

echo "🌙 Activating EXTRA Migraine Relief Mode..."
echo ""

# Function to run PowerShell commands from WSL
run_ps() {
    powershell.exe -NoProfile -Command "$1" 2>/dev/null
}

# 1. Reduce screen brightness to minimum
echo "⬇️  Reducing screen brightness..."
run_ps "(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,20)"

# 2. Enable Windows dark mode
echo "🌑 Enabling dark mode..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

# 3. Enable Focus Assist (Priority only mode)
echo "🔕 Enabling Focus Assist..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount -Name Current -Value 2"

# 4. Mute system volume
echo "🔇 Muting system volume..."
run_ps "(New-Object -ComObject WScript.Shell).SendKeys([char]173)"

# 5. Enable Night Light (reduces blue light)
echo "🌅 Enabling Night Light..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\DefaultAccount\Current\default\$windows.data.bluelightreduction.bluelightreductionstate\windows.data.bluelightreduction.bluelightreductionstate -Name Data -Value ([byte[]](0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00))"

# 6. Close common distracting applications
echo "❌ Closing potentially distracting apps..."
run_ps "Get-Process -Name 'ms-teams','Teams','slack','Discord','Spotify' -ErrorAction SilentlyContinue | Stop-Process -Force"

# 7. Increase display zoom to 150%
echo "🔍 Increasing display zoom to 150%..."
run_ps "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name LogPixels -Value 144"
run_ps "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Win8DpiScaling -Value 1"

# 8. Set a calm reminder
echo ""
echo "✅ EXTRA Migraine mode activated!"
echo ""
echo "💙 Remember to:"
echo "   • Rest in a dark, quiet room"
echo "   • Stay hydrated"
echo "   • Take your medication if needed"
echo "   • Close your eyes and breathe deeply"
echo ""
echo "⚠️  You may need to log out/in for zoom changes to fully apply"
echo ""
echo "Run 'restore-normal' when you're feeling better"
