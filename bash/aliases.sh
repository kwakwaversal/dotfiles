# management
alias dots="cd ~/.dotfiles && vim"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && git pull && ./install.sh; cd -'

# docker related
alias d='docker'
alias d-ips='docker ps -q | while read cid b; do echo -n "$cid "; d inspect $cid | jq -r ".[0].NetworkSettings.Networks | to_entries[] | .value.IPAddress"; done'

# docker-compose related (don't care about the dc precision calculator)
alias dc='docker-compose'

# git
alias g="git"
alias gs="git status"
alias gw="git show"
alias gw^="git show HEAD^"
alias gw^^="git show HEAD^^"
alias gw^^^="git show HEAD^^^"
alias gw^^^^="git show HEAD^^^^"
