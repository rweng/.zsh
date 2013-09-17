# 7.1. Convenience Aliases/Macros
# --------------------------------
alias bgd='bg; disown %1'
alias cp='nocorrect cp'            # don't correct spelling for 'cp'
alias ez="$EDITOR $ZDOTDIR/zshrc && source $ZDOTDIR/zshrc"
alias rz="source $ZDOTDIR/zshrc"
alias mkdir='nocorrect mkdir'      # don't correct spelling for 'mkdir'
alias mv='nocorrect mv'            # don't correct spelling for 'mv'

# ls Aliases
# ----------------
alias l='ls -BFG'
alias la='l -A'
alias ll='l -l'
alias lla='ll -A'

alias e="$EDITOR"
alias e.="$EDITOR ."
alias t="task"

alias proxy="ssh -D 8080 arc2"
alias rproxy="ssh -R 4000:localhost:3000 arc2"

alias psg="ps -ef|grep"

if function_exists trash; then
	alias rm="trash"
elif command_exists rmtrash; then
	alias rm="rmtrash"
else
	echo "no alias for rm"
fi

rm.(){
	CURPWD="$PWD"
	cd ..
	rm -rf "$CURPWD"	
}

# kill pid that listens on given port
# e.g. kport 3000
kport(){
	PID_FOUND=`lsof -i :$1|awk '{ print $2 }'| awk 'NR==2'`
	kill ${PID_FOUND}
}


# postgresql
alias pg+="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg-="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# mysql
alias mysql+="mysqld_safe --skip-grant-tables &"

# commands starting with % for pasting from web
alias %=' '

# OS X
if mac; then
  alias sleepmac="osascript -e 'tell application \"System Events\" to sleep'"

  alias updatedb="sudo /usr/libexec/locate.updatedb"
  alias flush_dns="dscacheutil -flushcache"

	alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder"
	alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder"
fi