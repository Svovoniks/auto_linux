#!/bin/bash

sudo apt update
# make a dirctory for app binaries
mkdir -p ~/Downloads/apps/

# install package managers
sudo apt install snapd                                                                          # snap
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # brew

# install chrome
wget -P ~/Downloads/apps/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ~/Downloads/apps/google-chrome.deb

# install nvim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim

# expose nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
sudo ln -s /squashfs-root/AppRun /usr/bin/vi
sudo ln -s /squashfs-root/AppRun /usr/bin/vim

# install telegram
wget -P ~/Downloads/apps/telegram.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.xz -C ~/apps

# setup zsh
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# from ThePrimagen
sudo apt install stow
zsh ubuntu

# install tmux
sudo apt install tmux

# setup python
sudo apt install python3-pip

# setup node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 20

# setup golang
wget -P ~/Downloads https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf ~/Downloads/go1.24.1.linux-amd64.tar.gz

# fix clock for dualboot
timedatectl set-local-rtc 1 --adjust-system-clock

# install jq
sudo apt install jq

# setup wallpaper
sudo apt install feh
sudo apt install compton

# install screenshot tool
sudo apt install maim

# install i3lock
sudo apt install i3lock

# istall gnome-tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks

# install image2txt tool
sudo snap install frog

# install shellcheck
sudo apt install shellcheck

# setup git
repo="git-ecosystem/git-credential-manager"
latest_release_url=$(wget -qO- "https://api.github.com/repos/$repo/releases/latest" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')
wget -O ~/Downloads/git-gcm.deb "$latest_release_url"
sudo dpkg -i ~/Downloads/git-gcm.deb
git-credential-manager configure
git config --global credential.credentialStore secretservice

# install brigtness tool
sudo apt install brightnessctl

sudo apt install os-prober

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

read -r -p "Install os-prober?" response
if [[ "$response" =~ ^[yY]([eE][sS])?$ ]]; then
    install os-prober
    sudo os-prober
    sudo mount /dev/nvme0n1p1 /mnt
    sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI
else
    echo "Skipped"
fi
