# docker related
alias d='docker'
alias d-ips='docker ps -q | while read cid b; do echo -n "$cid "; d inspect $cid | jq -r ".[0].NetworkSettings.Networks | to_entries[] | .value.IPAddress"; done'

# docker-compose related (don't care about the dc precision calculator)
alias dc='docker-compose'

