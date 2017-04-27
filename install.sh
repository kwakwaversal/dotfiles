#!/usr/bin/env bash

[[ -s ~/.profile ]] && source ~/.profile

PROFILE="$HOME/.bash_profile"

if [ -e "$PROFILE" ]
then
   echo "File $PROFILE exists. Doing nothing."
else
   ln -s ~/.dotfiles/bash_profile $PROFILE
fi
