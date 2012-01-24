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
if mac; then
    gls_path=`which gls`
    if [[ -x "$gls_path" ]]; then
        alias ls='$gls_path -BF --color=auto'
        alias la='$gls_path -AF --color=auto'
    else
        alias ls='ls -BF'
        alias la='ls -AF'
    fi
else
    alias ls='ls -BF --color=auto'
    alias la='ls -AF --color=auto'
fi
alias ll='ls -l'
alias lsd='ls -d'
alias lld='ls -dl'
alias e="$EDITOR"

# git
if command_exists git; then
	if command_exists hub; then
		alias git='hub'
	fi
	# alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
	
	# alias a='git add'
	# alias b='git branch'
	# alias c='git commit'
	# alias cam='git commit -a -m'
	# alias co='git checkout'
	# alias chp='git cherry-pick'
	# alias d='git diff'
	# alias dc='git diff --cached'
	# alias ds='git diff --stat'
	# alias f='git fetch'
	# alias gl='git log'
	# alias glo='git log --oneline --decorate'
	# alias gls='git log --stat'
	# alias m='git merge'
	# alias rbi='git rebase -i --autosquash'
	# alias rbiom='git rebase -i --autosquash origin/master'

fi

# rails
alias r="rails"
alias tlog='tail -f log/development.log'
alias rst='touch tmp/restart.txt'
alias bi="bundle install"
alias bu="bundle update"
alias rake_db_migrate_both="rake db:migrate && rake db:migrate RAILS_ENV=test"
alias kicker="be kicker -r rails -b 'spin push'"

# commands starting with % for pasting from web
alias %=' '

alias sleepmac="osascript -e 'tell application \"System Events\" to sleep'"