# Helpful bind-related commands
#
# `bind -p`     list *all* the current bindings
# `bind -X`     for user-specific bindings
#
# http://www.skorks.com/2009/09/bash-shortcuts-for-maximum-productivity/
# http://www.lbreyer.com/bash-smart-parsing-howto.html

# CTRL+L has been overridden for the tmux pane movement so using ALT+L instead.
bind -x '"\el"':clear

# Overriding bash shortcut CTRL+f (move forward 1 character) to append `| fzf`
# to the end of the current command if `fzf` exists in the path.
if hash fzf >/dev/null 2>&1; then
    bind '"\C-f": "\C-e| fzf\n"'
fi
