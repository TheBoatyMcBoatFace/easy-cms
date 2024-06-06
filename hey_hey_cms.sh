#!/bin/bash

# Load the .env file
echo "🔄 Loading the .env file. As if your life's secrets reside in it..."
source ".env"

# Generate the OTP
echo "🔐 Generating the OTP. Because, you know, security theater..."
OTP=$(expect -c "
spawn totp-cli generate $NAMESPACE $ACCOUNT
expect \"Password:\"
send \"$TOKEN_PASS\r\"
expect eof
" | tail -1)

if [ -z "$OTP" ]; then
    echo "❌ Failed to generate OTP. Looks like security theater is having a bad day."
    exit 1
fi

# Clear terminal to hide tokens in plain sight
clear

# Open Microsoft Outlook only after VPN is connected
echo "📬 Summoning the soul-sucking entity known as Microsoft Outlook..."
open -a Microsoft\ Outlook
echo "Microsoft Outlook opened. I don't like it either.... 🤷"

echo "📨 Outlook is openeing, lets touch gloves with CMS? "

# Start the VPN connection
echo "🔗 Initiating VPN connection. CMS' vpn? let's go? I guess?"
expect -c "
set timeout -1
spawn sudo openconnect https://cloudvpn.cms.gov

# Sending the certificate PIN
expect \"Enter PIN for\"
send \"$ROOT_PASS\r\"

# Handling the username input
expect \"Username:\"
send \"$USER_NAME\r\"

# Handling the first password input (your account password)
expect \"Password:\"
send \"$PASSWORD\r\"

# Handling the OTP input (the generated TOTP)
expect \"Password:\"
send \"$OTP\r\"

interact

clear
"

if [ $? -ne 0 ]; then
    echo "❌ VPN connection failed. Looks like CMS hates you. Better luck next time?"
    exit 1
fi




# Clear sensitive data from memory. We wouldn't want the 8 CHARACTER CMS PASSWORD public now would we?
unset ROOT_PASS
unset USER_NAME
unset PASSWORD
unset MFA_TOKEN
unset TOKEN_PASS
unset NAMESPACE
unset ACCOUNT

# Command to terminate Microsoft Outlook
echo "🛑 Closing Microsoft Outlook..."
killall Microsoft\ Outlook
osascript -e 'quit app "Microsoft Outlook"'
echo "Microsoft Outlook closed."
