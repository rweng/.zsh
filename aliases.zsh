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

# rails
alias bi="bundle install"
alias bu="bundle update"
alias psg="ps -ef|grep"
alias rm="trash"

# commands starting with % for pasting from web
alias %=' '

alias sleepmac="osascript -e 'tell application \"System Events\" to sleep'"