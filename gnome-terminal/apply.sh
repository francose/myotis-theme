#!/usr/bin/env bash
# Apply the Gruvbox GNOME Terminal theme to the default profile.
set -euo pipefail
PROF="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \")"
PATH_="/org/gnome/terminal/legacy/profiles:/:${PROF}/"
dconf load "$PATH_" < "$(dirname "$0")/gruvbox.dconf"
echo "Gruvbox terminal theme applied to profile $PROF"
