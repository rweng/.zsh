# 7.1. Convenience Aliases/Macros
# --------------------------------
alias bgd='bg; disown %1'
alias cp='nocorrect cp'            # don't correct spelling for 'cp'
alias ev="$EDITOR ~/config/vim/vimrc"
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

# rails
alias bi="bundle install"
alias bu="bundle update"
alias psg="ps -ef|grep"

if command_exists trash; then
  alias rm="trash"
fi

rm.(){
	CURPWD="$PWD"
	cd ..
	rm -rf "$CURPWD"	
}

# ensure that role jsons are generated for littlechef
alias fix="rake roles:to_json && fix"


# postgresql
alias pg+="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg-="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# mysql
alias mysql+="mysqld_safe --skip-grant-tables &"


# commands starting with % for pasting from web
alias %=' '


if mac; then
  alias sleepmac="osascript -e 'tell application \"System Events\" to sleep'"

  alias updatedb="sudo /usr/libexec/locate.updatedb"
fi