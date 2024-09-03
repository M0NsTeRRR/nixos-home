#!/bin/sh

bluetooth_status=$(rfkill list bluetooth | grep -i -o "Soft blocked: yes")

if [ -z "$bluetooth_status" ]; then
    rfkill block bluetooth
else
    rfkill unblock bluetooth
fi