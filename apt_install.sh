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
packages=("regolith-desktop" "regolith-session-flashback" "regolith-look-lascaille" "i3lock" "feh" "compton" "gnome-tweaks" "brightnessctl")
sudo apt install -y "${packages[@]}"

# os-prober
packages=("os-prober")
sudo apt install -y "${packages[@]}"

# misc
packages=("jq" "shellcheck" "tmux" "zsh" "stow" "python3.12" "obs-studio")
sudo apt install -y "${packages[@]}"
