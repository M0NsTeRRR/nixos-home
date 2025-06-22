#!/bin/bash

yad \
--width=950 \
--height=550 \
--center \
--fixed \
--title="Keybindings" \
--no-buttons \
--list \
--column=Key: \
--column=Description: \
--timeout=90 \
--timeout-indicat \
" + Q" "Terminal" \
" + C" "Kill active" \
" + K" "Force Kill active" \
" + L" "Lock" \
" + E" "File Manager" \
" + V" "Toogle floating" \
" + R" "App menu" \
" + P" "Pseudo dwindle" \
" + J" "Toogle split" \
" + I" "Hyprexpo" \
"PRINT" "Screenshot a region" \
" + <Direction arrow>" "Move focus" \
" + SHIFT + <Direction arrow>" "Move window" \
" + S" "Toggle special workspace" \
" + <Number>" "Switch workspace" \
" + SHIFT + <Number>" "Move active window to a workspace" \
" + Tab" "Move to next workspace"
