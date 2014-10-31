echo "start"
# contains interactive-session only stuff

. ~/.zsh/config.zsh


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# setup direnv
eval "$(direnv hook zsh)"

if [ -f ~/.localrc ]; then
	. ~/.localrc
fi


