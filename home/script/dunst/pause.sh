#!/bin/sh

count_waiting=$(dunstctl count waiting)
count_displayed=$(dunstctl count displayed)
enabled="{ \"text\": \"󰂜\", \"tooltip\": \"notifications <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
disabled="{ \"text\": \"󰪑\", \"tooltip\": \"notifications <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"

if [ "$count_displayed" -ne 0 ]; then
    enabled="{ \"text\": \"󰂚$count_displayed\", \"tooltip\": \"$count_displayed notifications\", \"class\": \"on\" }"
fi

if [ "$count_waiting" -ne 0 ]; then
    disabled="{ \"text\": \"󰂛$count_waiting\", \"tooltip\": \"(silent) $count_waiting notifications\", \"class\": \"off\" }"
fi

if dunstctl is-paused | grep -q "false"; then
    echo "$enabled"
else
    echo "$disabled"
fi