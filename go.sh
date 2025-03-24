#!/usr/bin/env bash

# make a dirctory for app binaries
mkdir -p ~/Downloads/apps/
mkdir -p ~/apps/

# add apt repositories
bash ./apt_add_repo.sh

# install apt packages
bash ./apt_install.sh

# install brew
read -r -p "Install brew?" response
if [[ "$response" =~ ^[yY]([eE][sS])?$ ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # brew
else
    echo "Skipped"
fi

# fix clock for dualboot
timedatectl set-local-rtc 1 --adjust-system-clock

# install os-prober
read -r -p "Install os-prober?" response
if [[ "$response" =~ ^[yY]([eE][sS])?$ ]]; then
    sudo apt install os-prober
    sudo os-prober
    sudo mount /dev/nvme0n1p1 /mnt
    sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI
else
    echo "Skipped"
fi

bash ./install_dotfiles.sh
