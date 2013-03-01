# helpers
GIT_VERSION="$(git --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
GIT_VERSION_MAJOR="${GIT_VERSION%%.*}"
GIT_VERSION_MINOR="${${GIT_VERSION%.*}#*.}"
GIT_VERSION_REVISION="${GIT_VERSION##*.}"


# DEFINITIONS

alias g='git'
compdef g=git

# git status
if [ "$GIT_VERSION_MINOR" -ge 7 ] && [ "$GIT_VERSION_REVISION" -ge 1 ]; then
    alias gs='git status -sb'
else
    alias gs='git status'
fi
compdef _git gs=git-status


# git unstage
alias gus="g reset HEAD"
# git stage all
alias gst="g add -u"


# completely resets to master
alias greset='git checkout .; git clean -df;'

# git commit all
alias gca='gst;gs;read;git commit'
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
gdv() { git-diff -w "$@" | view - }
compdef _git gdv=git-diff
compdef _git gca=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gm='git merge'
compdef _git gm=git-merge
alias gd='git diff'
alias gc='git clone'
compdef _git gc=git-clone

gpatch(){
	git format-patch ${1:-master} --stdout
}

gcap(){
	gca "${@}"
	gp
}
alias git-authors='git shortlog -s -n'

gcd(){ 
	echo -$1; 
	if [ "$2" = "" ];then 
		2=`echo $1|ruby -e "puts STDIN.read.split('/').last.split('.')[0..-2].join('.')"`
	fi;
	git clone $1 $2
	cd $2
}
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git
