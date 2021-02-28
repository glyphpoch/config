~#!/bin/bash

set -xeu

sudo apt update

sudo apt install \
    i3 \
    i3lock-fancy \
    dunst \
    rofi \
    redshift \
    autorandr \
    polybar \
    picom \
    pavucontrol \
    lm-sensors \
    feh \
    fonts-font-awesome \
    tmux \
    arandr \
    jq \
    curl \
    fzf \
    git

# fzf reverse search
cat /usr/share/doc/fzf/README.Debian

# Install rust + fd-find + ripgrep

# Temp notification
# sensors -j | jq '."coretemp-isa-0000"."Package id 0"."temp1_input"'


# Backup
# cp ~/setup.sh ./
# cp ~/.tmux.conf ./
# cp -r ~/.config/alacritty/ ./.config/
# cp -r ~/.config/polybar/ ./.config/
# cp -r ~/.config/autorandr/allmonitors/ ./.config/
# cp -r ~/.config/i3/ ./.config/
# cp -r ~/.config/redshift/ ./.config/
# cp -r ~/.config/dunst/ ./.config/
# cp -r ~/.config/kanshi/ ./.config/
# cp -r ~/.config/sway/ ./.config/
# cp -r ~/.config/wallpapers/ ./.config/
# cp -r ~/.config/waybar/ ./.config/
# cp -r ~/.config/wm-config-templates/ ./.config/
# cp -r ~/.config/picom/ ./.config/
# cp -r ~/.config/wofi/ ./.config/
# cp ~/.local/bin/ ./.local/
# cp -r ~/.local/bin/ ./.local/

# Restore
# TODO
