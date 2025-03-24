#!/usr/bin/env zsh

STOW_FOLDERS="bin,i3,nvim,tmux,zsh,regolith3,wallpapers,svovo_sys"

DOTFILES=$HOME/.dotfiles

echo "Choose action:"
echo "  1: stow files"
echo "  2: to unstow files:"
read -r -p "Cooose:" action

# Validate the input
if [[ "$action" == "1" ]]; then
    STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES $DOTFILES/stow_dotfiles.sh
elif [[ "$action" == "2" ]]; then
    STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES $DOTFILES/unstow_dotfiles.sh
else
    echo "i didn't do nothing"
fi
