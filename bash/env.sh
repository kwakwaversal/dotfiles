export EDITOR='vim'

# Pow shouldn't hide errors in non-ASCII apps:
# https://github.com/37signals/pow/issues/268
# Also fixes UTF-8 display in e.g. git log.
export LANG=en_GB.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG
