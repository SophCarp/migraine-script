#!/bin/bash

echo "☀️  Restoring Normal Mode..."
echo ""

# Function to run PowerShell commands from WSL
run_ps() {
    powershell.exe -NoProfile -Command "$1" 2>/dev/null
}

# 1. Restore screen brightness
echo "⬆️  Restoring screen brightness..."
run_ps "(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,80)"

# 2. Restore light mode (optional - comment out if you prefer dark mode)
echo "☀️  Restoring light theme..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1"
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 1"

# 3. Disable Focus Assist
echo "🔔 Disabling Focus Assist..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount -Name Current -Value 0"

# 4. Unmute system volume (set to 50%)
echo "🔊 Restoring system volume..."
run_ps "(New-Object -ComObject WScript.Shell).SendKeys([char]175)" # Unmute

# 5. Disable Night Light
echo "🌞 Disabling Night Light..."
run_ps "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\DefaultAccount\Current\default\$windows.data.bluelightreduction.bluelightreductionstate\windows.data.bluelightreduction.bluelightreductionstate -Name Data -Value ([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"

# 6. Restore display zoom to 100%
echo "🔍 Restoring display zoom to 100%..."
run_ps "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name LogPixels -Value 96"
run_ps "Remove-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Win8DpiScaling -ErrorAction SilentlyContinue"

echo ""
echo "✅ Normal mode restored!"
echo "💚 Hope you're feeling better!"
