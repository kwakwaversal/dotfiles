#!/usr/bin/env bash

# This is for me and me alone. Sets up a fresh environment with things I need

echo ""
echo "Setting up environment:"

if [ -e "$HOME/.bash_profile" ]
then
    echo "  - mv ~/.bash_profile ~/.profile.local"    
    mv "$HOME/.bash_profile" "$HOME/.profile.local"
fi

if [ ! -e "$HOME/.vim" ]
then
    echo "  - git clone vimfiles"
    git clone --recursive https://github.com/kwakwaversal/vimfiles $HOME/.vim
fi

if [ ! -e "$HOME/.fzf" ]
then
    echo "  - git clone fzf"
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    echo "  - install fzf"
    $HOME/.fzf/install --key-bindings --completion --update-rc
fi

$HOME/.dotfiles/install.sh
