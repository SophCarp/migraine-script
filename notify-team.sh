#!/bin/bash

echo "💬 Notifying team about migraine leave..."
echo ""

# Function to run PowerShell commands from WSL
run_ps() {
    powershell.exe -NoProfile -Command "$1" 2>/dev/null
}

# Configuration - EDIT THESE VALUES
MANAGER_EMAIL="manager@company.com"
TEAM_CHANNEL_WEBHOOK=""  # Optional: Teams webhook URL
BACKUP_PERSON_EMAIL="backup@company.com"

# Message content
MESSAGE="Hi, I'm experiencing a migraine and need to leave work for the rest of the day. I'll be offline and will catch up when I'm back. Thanks for understanding."

echo "📧 Sending notification email..."
run_ps @"
\$Outlook = New-Object -ComObject Outlook.Application
\$Mail = \$Outlook.CreateItem(0)
\$Mail.To = '$MANAGER_EMAIL'
\$Mail.CC = '$BACKUP_PERSON_EMAIL'
\$Mail.Subject = 'Out Sick - Migraine'
\$Mail.Body = '$MESSAGE'
\$Mail.Send()
"@

echo "💼 Setting Teams status to 'Away - Out Sick'..."
# Note: This requires Teams PowerShell module or Graph API authentication
# For now, we'll use a simpler approach via Teams URL scheme
run_ps "Start-Process 'msteams:/l/chat/0/compose?message=Out%20sick%20with%20migraine%20-%20back%20tomorrow'"

echo ""
echo "✅ Notifications sent!"
echo ""
echo "💙 Now run 'migraine' to set up your computer and rest"
