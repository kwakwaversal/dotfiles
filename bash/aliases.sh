# dotfile and vimfile management
alias cdv='cd ~/.vim'
alias dots='cd ~/.dotfiles && vim'
alias reload='exec $SHELL -l'
alias redot='cd ~/.dotfiles && git pull && ./install.sh; cd -'

# docker related
alias d='docker'
alias d-ips='docker ps -q | while read cid b; do echo -n "$cid "; d inspect $cid | jq -r ".[0].NetworkSettings.Networks | to_entries[] | .value.IPAddress"; done'
# volume mount PWD into ephemeral container
alias dpwd='docker run -it --rm -v $(pwd):/pwd'
# same as above but mounts the PWD with the host's user:group permissions
alias dpwdu='docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/pwd'

# docker-compose related (don't care about the dc precision calculator)
function dc {
    if [[ $# > 0 ]]; then
        docker-compose $@
    else
        docker-compose ps
    fi
}

# git
function g {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status
    fi
}
alias ga='git add'
alias gc='git commit'
alias gcd='cd $(git rev-parse --show-toplevel)' # change to repo root directory
alias gd='git diff'             # What's changed? Both staged and unstaged.
alias gds='git diff --staged'   # What's changed? Only staged (added) changes.
alias gl='git log'
alias gw='git show'
alias gw^^^^='git show HEAD^^^^'
alias gw^^^='git show HEAD^^^'
alias gw^^='git show HEAD^^'
alias gw^='git show HEAD^'

# misc
alias bigdirs='du --block-size=1 -a $(pwd) | sort -n -r | head -n 20 | numfmt --to=iec-i'
alias jtags="ctags . && sed -i -r '/^(if|switch|function|exports|it|describe)\t.+\.js\t/d' tags"

# might require `apt-get install bash-completion`
if [ -e '/usr/share/bash-completion/completions/git' ]
then
    source /usr/share/bash-completion/completions/git
    __git_complete g _git
fi

# https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
alias tmux='TERM=xterm-256color tmux'
alias tx='TERM=xterm-256color tmuxinator'

# https://unencumberedbyfacts.com/2016/01/04/psql-vim-happy-face/
# http://www.craigkerstiens.com/2013/02/21/more-out-of-psql/
#   vim --servername PSQL
# alias psql='EDITOR="vim --servername PSQL --remote-tab-wait" PAGER="vim -R -u ~/.vim/vimrcpg -" psql'

# miscellaneous
alias weeknumber='date +%V'
alias makefile-targets='grep "^[^#[:space:]].*:" Makefile'
