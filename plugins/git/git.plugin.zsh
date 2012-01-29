# Aliases
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
gdv() { git-diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gca='git commit -v -a'
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
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gca='grm; git add .;gs;read;git commit'
alias git-authors='git shortlog -s -n'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
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


GIT_VERSION="$(git --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
GIT_VERSION_MAJOR="${GIT_VERSION%%.*}"
GIT_VERSION_MINOR="${${GIT_VERSION%.*}#*.}"
GIT_VERSION_REVISION="${GIT_VERSION##*.}"
if [ "$GIT_VERSION_MINOR" -ge 7 ] && [ "$GIT_VERSION_REVISION" -ge 1 ]; then
    alias gs='git status -sb'
else
    alias gs='git status'
fi

