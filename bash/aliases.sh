# dotfile management
alias dots='cd ~/.dotfiles && vim'
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && git pull && ./install.sh; cd -'

# docker related
alias d='docker'
alias d-ips='docker ps -q | while read cid b; do echo -n "$cid "; d inspect $cid | jq -r ".[0].NetworkSettings.Networks | to_entries[] | .value.IPAddress"; done'
alias dpwd='docker run -it --rm -v $(pwd):/pwd'

# docker-compose related (don't care about the dc precision calculator)
alias dc='docker-compose'

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

# might require `apt-get install bash-completion`
if [ -e '/usr/share/bash-completion/completions/git' ]
then
    source /usr/share/bash-completion/completions/git
    __git_complete g _git
fi

# https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
alias tmux='TERM=xterm-256color tmux'

# https://unencumberedbyfacts.com/2016/01/04/psql-vim-happy-face/
# http://www.craigkerstiens.com/2013/02/21/more-out-of-psql/
#   vim --servername PSQL
alias psql='EDITOR="vim --servername PSQL --remote-tab-wait" PAGER="vim -R -u ~/.vim/vimrcpg -" psql'

# miscellaneous
alias weeknumber='date +%V'
alias makefile-targets='grep "^[^#[:space:]].*:" Makefile'
