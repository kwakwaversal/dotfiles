#!/usr/bin/env bash

PROFILE="$HOME/.bash_profile"
TMUX="$HOME/.tmux.conf"

echo "Bootstrapping environment to use ~/.dotfiles"

echo ""
echo "Symlink $PROFILE:"
echo "  - ln -s ~/.dotfiles/bash_profile $PROFILE"
if [ -e "$PROFILE" ]
then
   echo "    - Already exists. Doing nothing."
else
   ln -s ~/.dotfiles/bash_profile $PROFILE
   if [ -e "$PROFILE" ]
   then
       echo "    + Added"
   else
       echo "    - Could not create symlink?"
   fi
fi

echo ""
echo "Symlink $TMUX:"
echo "  - ln -s ~/.dotfiles/tmux.conf $TMUX"
if [ -e "$TMUX" ]
then
   echo "    - Already exists. Doing nothing."
else
   ln -s ~/.dotfiles/tmux.conf $TMUX
   if [ -e "$TMUX" ]
   then
       echo "    + Added"
   else
       echo "    - Could not create symlink?"
   fi
fi

git config --global include.path .dotfiles/.gitconfig
