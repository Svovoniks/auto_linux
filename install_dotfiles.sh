#!/usr/bin/env bash

git clone https://github.com/Svovoniks/linux_config "$HOME/.dotfiles"

rm -f  "$HOME/.zshrc"
bash  "$HOME/.dotfiles/manage_dotfiles.sh" 1
