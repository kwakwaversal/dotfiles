#!/usr/bin/env bash

PROFILE="$HOME/.bash_profile"
TMUX="$HOME/.tmux.conf"

if [ -e "$PROFILE" ]
then
   echo "File $PROFILE exists. Doing nothing."
else
   ln -s ~/.dotfiles/bash_profile $PROFILE
fi

if [ -e "$TMUX" ]
then
   echo "File $TMUX exists. Doing nothing."
else
   ln -s ~/.dotfiles/tmux.conf $TMUX
fi

git config --global include.path .dotfiles/.gitconfig
