fpath=($OMZ/plugins/rvm $fpath)
autoload -U compinit
compinit -i

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
