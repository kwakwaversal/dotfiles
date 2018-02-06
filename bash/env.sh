export EDITOR='vim'

# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-historyA
#
# I don't think this works, and might need the fix from the URL above to
# actually erase duplicates.
export HISTCONTROL=ignoredups:erasedups

# Pow shouldn't hide errors in non-ASCII apps:
# https://github.com/37signals/pow/issues/268
# Also fixes UTF-8 display in e.g. git log.
export LANG=en_GB.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG
