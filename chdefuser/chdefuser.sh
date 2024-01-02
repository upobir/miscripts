#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Cannot change default user without sudo privileges"
    exit 1
fi

echo Choose new default user:
newdefuser=$(getent passwd | grep "/home/.*:/bin/bash" | sed 's/:.*$//' | gum choose)

if [ -z "$newdefuser" ]; then
    echo Default user unchanged
    exit 1
fi

sed -i "/^\[user\]$/,/^\[.*]$/ s/\(default=\).*/\1$newdefuser/" /etc/wsl.conf

if [ $? -eq 0 ]; then
    echo Default user changed to $newdefuser
else
    echo Failed to change default user
fi
