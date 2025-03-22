#!/bin/bash

sudo apt update
# make a dirctory for app binaries
mkdir -p ~/Downloads/apps/
mkdir -p ~/apps/

# install package managers
sudo apt install snapd -y # snap
read -r -p "Install brew?" response
if [[ "$response" =~ ^[yY]([eE][sS])?$ ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # brew
else
    echo "Skipped"
fi

# install chrome
wget -O ~/Downloads/apps/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ~/Downloads/apps/google-chrome.deb

# install nvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim -y

# install telegram
wget -O ~/Downloads/apps/telegram.tar https://telegram.org/dl/desktop/linux
tar -xvf ~/Downloads/apps/telegram.tar -C ~/apps

# setup zsh
sudo apt install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# from ThePrimagen
sudo apt install stow -y
zsh ubuntu

# install tmux
sudo apt install tmux -y

# setup python
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12

# setup node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 20

# setup golang
wget -P ~/Downloads https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf ~/Downloads/go1.24.1.linux-amd64.tar.gz

# fix clock for dualboot
timedatectl set-local-rtc 1 --adjust-system-clock

# install jq
sudo apt install jq -y

# setup wallpaper
sudo apt install feh compton -y

# install screenshot tool
sudo apt install maim -y

# install i3lock
sudo apt install i3lock -y

# istall gnome-tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks -y

# install image2txt tool
sudo snap install frog

# install shellcheck
sudo apt install shellcheck -y

# setup git
repo="git-ecosystem/git-credential-manager"
latest_release_url=$(wget -qO- "https://api.github.com/repos/$repo/releases/latest" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')
wget -O ~/Downloads/git-gcm.deb "$latest_release_url"
sudo dpkg -i ~/Downloads/git-gcm.deb
git-credential-manager configure
git config --global credential.credentialStore secretservice

# install brigtness tool
sudo apt install brightnessctl -y

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install regolith
wget -qO - https://archive.regolith-desktop.com/regolith.key |
    gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg >/dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://archive.regolith-desktop.com/ubuntu/stable jammy v3.2" |
    sudo tee /etc/apt/sources.list.d/regolith.list
sudo apt update
sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille

read -r -p "Install os-prober?" response
if [[ "$response" =~ ^[yY]([eE][sS])?$ ]]; then
    sudo apt install os-prober
    sudo os-prober
    sudo mount /dev/nvme0n1p1 /mnt
    sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI
else
    echo "Skipped"
fi
