#!/usr/bin/env bash

sudo apt update

# snap
packages=("snapd")
sudo apt install -y "${packages[@]}"

# nvim
packages=("make" "gcc" "ripgrep" "unzip" "git" "xclip" "neovim")
sudo apt install -y "${packages[@]}"

# screenshot
packages=("maim")

# i3 + regolith
packages=("regolith-desktop" "regolith-session-flashback" "regolith-look-lascaille" "i3lock" "feh" "compton" "gnome-tweaks" "brightnessctl"  "dmenu" "i3status")
sudo apt install -y "${packages[@]}"

# os-prober
packages=("os-prober")
sudo apt install -y "${packages[@]}"

# lua rocks reqs
packages=("build-essential" "libreadline-dev" "unzip")
sudo apt install -y "${packages[@]}"

# misc
packages=("jq" "shellcheck" "tmux" "zsh" "stow" "python3.12" "obs-studio"  "fzf")
sudo apt install -y "${packages[@]}"
