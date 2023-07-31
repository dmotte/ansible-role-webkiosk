#!/bin/bash

set -e

# Get display resolution

DISPLAY_RESOLUTION="$(xrandr --current | grep '*' | uniq | awk '{print $1}')"
DISPLAY_RES_W="$(echo $DISPLAY_RESOLUTION | cut -dx -f1 | sed 's/[^0-9]*//g')"
DISPLAY_RES_H="$(echo $DISPLAY_RESOLUTION | cut -dx -f2 | sed 's/[^0-9]*//g')"

# Disable Xorg screen blanking and DPMS

xset s off -dpms

# Disable some keys (see https://stackoverflow.com/a/44804851)

xmodmap -e 'keycode 37 = '   # Disable the CTRL_L key in the current display
xmodmap -e 'keycode 105 = '  # Disable the CTRL_R key in the current display

xmodmap -e 'keycode 64 = '   # Disable the Alt_L key in the current display
xmodmap -e 'keycode 204 = '

xmodmap -e 'keycode 133 = '  # Disable the Super_L key in the current display
xmodmap -e 'keycode 134 = '  # Disable the Super_R key in the current display

xmodmap -e 'keycode 67 = Escape'  # Disable the F1 key in the current display
xmodmap -e 'keycode 71 = Escape'  # Disable the F5 key in the current display

# Start Chromium in kiosk mode
# For more information on the command line options, see the following link:
# https://peter.sh/experiments/chromium-command-line-switches/

chromium --kiosk \
    --window-position=0,0 --window-size="$DISPLAY_RES_W,$DISPLAY_RES_H" \
    --disable-translate --disable-sync --noerrdialogs --no-message-box \
    --no-first-run --start-fullscreen --disable-hang-monitor \
    --disable-infobars --disable-logging --disable-sync \
    --disable-settings-window \
    '{{ webkiosk_url }}'
