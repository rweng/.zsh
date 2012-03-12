# 3.1. Parameters and Shell Functionality
# ---------------------------------------
#setopt ignoreeof           # ignore EOF ('^D') (i.e. don't log out on it)
setopt braceccl             # {a-d} expands to a b c d
# setopt noclobber            # don't overwrite existing files w/ > output redir
# setopt hist_allow_clobber   # C-p or UP and command has >| now, ready to go

# 3.2. Changing Directories
# -------------------------
setopt autocd               # automatically cd to a directory if not cmd
setopt autopushd            # automatically pushd directories on dirstack
setopt nopushdsilent        # print dirstack after each cd/pushd
setopt pushdignoredups      # don't push dups on stack
setopt pushdminus           # pushd -N goes to Nth dir in stack
export DIRSTACKSIZE=8

setopt autonamedirs             # % export h=/home/sjs; cd ~h; pwd => /home/sjs
setopt cdablevars               # blah=~/media/movies; cd blah; pwd => ~/media/movies

# 3.3. Shell Completion
# ---------------------
setopt correct              # try to correct spelling...
setopt no_correctall        # ...only for commands, not filenames
setopt no_listbeep          # don't beep on ambiguous listings
setopt listpacked           # variable col widths (takes up less space)

# 3.4. Shell Expansion and Globbing
# ---------------------------------
setopt extendedglob         # use extended globbing (#, ~, ^)


# 3.5. History and History Expansion
# ----------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=200000                 # huge internal buffer
export SAVEHIST=200000                 # huge history file

setopt extendedhistory      # save timestamps in history
setopt no_histbeep          # don't beep for erroneous history expansions
setopt histignoredups       # ignore consecutive dups in history
setopt histfindnodups       # backwards search produces diff result each time
setopt histreduceblanks     # compact consecutive white space chars (cool)
setopt histnostore          # don't store history related functions
setopt incappendhistory     # incrementally add items to HISTFILE
# this is very annoying
# setopt histverify         # confirm !: or ^ command results before execution
# setopt share_history 		# share history between sessions ???


# 3.6. Job Control
# ----------------
setopt longlistjobs         # list jobs in long format


# 3.7. Shell Prompt
# -----------------
setopt promptsubst          # allow paramater, command, so on in prompt
setopt transient_rprompt    # hide RPROMPT after cmdline is executed


# 3.8. ZLE
# --------
setopt no_beep          # don't beep on errors (in ZLE)
