#!/usr/bin/env bash

# chrome
wget -O ~/Downloads/apps/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ~/Downloads/apps/google-chrome.deb

# telegram
wget -O ~/Downloads/apps/telegram.tar https://telegram.org/dl/desktop/linux
tar -xvf ~/Downloads/apps/telegram.tar -C ~/apps

# ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 20

# golang
wget -P ~/Downloads https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf ~/Downloads/go1.24.1.linux-amd64.tar.gz

# git credential manager
repo="git-ecosystem/git-credential-manager"
latest_release_url=$(wget -qO- "https://api.github.com/repos/$repo/releases/latest" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')
wget -O ~/Downloads/git-gcm.deb "$latest_release_url"
sudo dpkg -i ~/Downloads/git-gcm.deb
git-credential-manager configure
git config --global credential.credentialStore secretservice

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
