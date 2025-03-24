#!/usr/bin/env bash

# nvim
sudo add-apt-repository -y ppa:neovim-ppa/unstable

# python
sudo add-apt-repository -y ppa:deadsnakes/ppa

# gnome-tweaks
sudo add-apt-repository -y universe

# regolith
wget -qO - https://archive.regolith-desktop.com/regolith.key |
    gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg >/dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://archive.regolith-desktop.com/ubuntu/stable jammy v3.2" |
    sudo tee /etc/apt/sources.list.d/regolith.list

# OBf
sudo add-apt-repository -y ppa:obsproject/obs-studio
