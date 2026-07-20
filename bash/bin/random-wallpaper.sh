#!/bin/bash

# (A lazier, newer version of gbackground)
#
# Suggested cron entry:
# 0 11 * * * $HOME/bin/random-wallpaper.sh

DIR="$HOME/Pictures/Wallpapers/Active"

# Assume they're all .jpg
FILE="$(find "$DIR" -maxdepth 1 -name '*.jpg' | shuf -n1)"

# Escape % chars in filenames
URI="file://$(python3 -c "import sys; from urllib.parse import quote; print(quote(sys.argv[1], safe='/'))" "$FILE")"

# Needed by gsettings when running in cron
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Set as desktop wallpaper
gsettings set org.gnome.desktop.background picture-uri "$URI"
gsettings set org.gnome.desktop.background picture-uri-dark "$URI"
