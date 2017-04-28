#!/usr/bin/env bash

PROFILE="$HOME/.bash_profile"

if [ -e "$PROFILE" ]
then
   echo "File $PROFILE exists. Doing nothing."
else
   ln -s ~/.dotfiles/bash_profile $PROFILE
fi

git config --global include.path .dotfiles/.gitconfig
