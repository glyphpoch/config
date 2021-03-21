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
    git \
    flameshot

# Flameshot
# flameshot gui

# fzf reverse search
cat /usr/share/doc/fzf/README.Debian

sudo snap install zoom-client signal-desktop

# Install rust + fd-find + ripgrep

# Temp notification
# sensors -j | jq '."coretemp-isa-0000"."Package id 0"."temp1_input"'

# vim-plug for nvim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vim-plug for vim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#

# Clipboard manager
# rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 8' -modi drun,"clipboard:greenclip print"


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
