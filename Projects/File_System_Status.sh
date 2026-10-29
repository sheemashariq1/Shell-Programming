# =====================================================
# DISK SPACE MONITORING AND EMAIL ALERT SCRIPT
# =====================================================

#!/bin/bash

# Show disk space usage in the default units.
# df
# df -h /boot

# Show the usage percentage for sda2, excluding the header and tmpfs entries.
# df -H | egrep -v "Filesystem|tmpfs" | grep "sda2" | awk '{print $5}' | tr -d %

# Get root filesystem usage percentage
# df -H | awk '$NF == "/" {print $5}' | tr -d '%'

# STEP 1: CHECK THE REQUIRED SETUP BEFORE RUNNING
# - Run this script in Ubuntu/WSL or another Linux system.
# - Install the required packages:
#   sudo apt update
#   sudo apt install msmtp msmtp-mta bsd-mailx ca-certificates -y
#
# - Configure Gmail SMTP in ~/.msmtprc using:
#   smtp.gmail.com, port 587, TLS and a Gmail App Password.
# - Save the configuration and secure it using:
#   chmod 600 ~/.msmtprc
# - Test email delivery before running this script.

# STEP 2: GET ROOT FILESYSTEM DISK USAGE
# df -P / displays usage for the root filesystem.
# awk extracts the row for "/" and prints the usage percentage.
# tr removes the "%" symbol so Bash can compare the value numerically.

FU=$(df -H | awk '$NF == "/" {print $5}' | tr -d '%')
# Display current disk usage
echo "Disk usage is ${FU}%"

# STEP 3: SET THE EMAIL RECIPIENT
# Replace this address with the Gmail address that should receive disk space alerts.
TO="sheemashariq10@gmail.com"

# STEP 4: CHECK THE DISK USAGE THRESHOLD
# -ge means "greater than or equal to".
# If usage is 80% or higher, send an email alert.
# Otherwise, display "All Good".

if [[ $FU -ge 1 ]]; then

    # STEP 5: SEND THE EMAIL ALERT
    # echo creates the email message body.
    # mail -s sets the email subject.
    # The configured msmtp service sends the email.

    echo "Warning, disk space usage is high - ${FU}%" | mail -s "DISK SPACE ALERT!" "$TO"
    echo "Alert email sent!"
else
    # STEP 6: NO ALERT IS REQUIRED
    echo "All Good"
fi