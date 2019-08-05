#!/usr/bin/env bash

declare -A dotfiles
dotfiles["bash_profile"]="$HOME/.bash_profile"
dotfiles["ctags"]="$HOME/.ctags"
dotfiles["my.cnf"]="$HOME/.my.cnf"
dotfiles["psqlrc"]="$HOME/.psqlrc"
dotfiles["perltidyrc"]="$HOME/.perltidyrc"
dotfiles["tmux.conf"]="$HOME/.tmux.conf"

echo "Bootstrapping environment to use ~/.dotfiles"

for file in ${!dotfiles[@]}; do
    FILE=${file}
    LINK=${dotfiles[${file}]}

    echo ""
    echo "Symlink $LINK:"
    echo "  - ln -s ~/.dotfiles/$FILE $LINK"
    if [ -e "$LINK" ]
    then
        echo "    - Already exists. Doing nothing."
    else
        ln -s ~/.dotfiles/$FILE $LINK
        if [ -e "$LINK" ]
        then
            echo "    + Added"
        else
            echo "    - Could not create symlink?"
        fi
    fi
done

git config --global include.path .dotfiles/gitconfig
