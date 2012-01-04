# load functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# http://tomafro.net/2009/10/tip-cdpath-am-i-the-last-to-know
cdpath=(~ ~/code ~/Dropbox)


# 1. Environment Vars
# ===================
. ~/.zsh/env_vars.zsh


# 2. Limits
# =========
# limit coredumpsize        30m          # limit core dumps to 30mb
# limit stacksize            8m          # limit stack to 8mb


# 3. Shell Options
# ================
. ~/.zsh/options.zsh


# 4. Terminal Settings
# ====================

function precmd {
    rehash
}

autoload -U colors            # we need the colors for some formats below
colors


# 5. ZLE Keybindings
# ==================
bindkey '\ep' history-beginning-search-backward


# 6. Prompt Subsystem
# ===================

# Load the prompt theme system
autoload -U promptinit
promptinit


# 7. Aliases
# ===========
. ~/.zsh/aliases.zsh


# 8. Unsorted (new) stuff
# =======================

# if commands takes more than 10 seconds tell me how long it took
export REPORTTIME=10

# use less instead of the default more when no cmd is specified
export READNULLCMD=less

# set shell options
setopt no_badpattern            # supress err msgs
setopt cbases                   # 0xFF instead of 16#FF
setopt globsubst                # parameter expns eligible for filename expn & generation
setopt interactivecomments      # comments allowed in interactive shells
setopt no_hup                   # leave bg tasks running (a la nohup)
#setopt magicequalsubst         # performs filename expansion on 'arg' part of
                                #  foo=arg parameters.

bindkey -e                      # emacs style key bindings
bindkey '^I' complete-word      # complete on tab, leave expansion to _expand

# default in linux is backspace sends ^H, emacs no likey
#stty erase '^?'
TERMINFO=$HOME/.terminfo

# curl convenience functions
# ==========================
curl=`which curl`
if [[ -x "$curl" ]]; then

	# get <url>
    function get {
        $curl -i -H 'x-requested-with: XMLHttpRequest' "$1"
    }

	# put <url> <json>
    function put {
        $curl -i -X PUT -H 'x-requested-with: XMLHttpRequest' -H 'content-type: application/json' -d "$2" "$1"
    }

	# post <url> <json>
    function post {
        $curl -i -X POST -H 'x-requested-with: XMLHttpRequest' -H 'content-type: application/json' -d "$2" "$1"
    }

	# delete <url>
    function delete {
        $curl -i -X DELETE -H 'x-requested-with: XMLHttpRequest' "$1"
    }

fi

# 9. Completion
# =============

# more verbose completion prompt
zstyle ':completion:*' format '%SCompleting %U%d%u%s'
zstyle :completion::complete:cd:: tag-order \
        local-directories path-directories

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify %d:'
zstyle ':completion:*' completer _expand _complete _files
zstyle ':completion:*' expand prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$ZDOTDIR/zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall


# 10. SSH Keychain
# ================
# OS X includes keychain now, cool.
if command_exists keychain; then
    if [[ -f ~/.ssh/id_rsa ]]; then
        keychain --nogui ~/.ssh/id_rsa
    fi
    if [[ -f ~/.ssh/id_rsa-dreamhost ]]; then
        keychain --nogui ~/.ssh/id_rsa-dreamhost
    fi
    KEYCHAINFILE="$HOME/.keychain/$(hostname)-sh"
    if [[ -f $KEYCHAINFILE ]]; then
        source $KEYCHAINFILE >/dev/null
    fi
fi


# 11. rbenv
# =========

if command_exists rbenv; then
	eval "$(rbenv init -)"
fi