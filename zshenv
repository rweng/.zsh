. ~/.zsh/config.zsh

if [ -f ~/.localrc ]; then
	. ~/.localrc
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
