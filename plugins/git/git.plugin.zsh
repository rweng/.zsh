# helpers
GIT_VERSION="$(git --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
GIT_VERSION_MAJOR="${GIT_VERSION%%.*}"
GIT_VERSION_MINOR="${${GIT_VERSION%.*}#*.}"
GIT_VERSION_REVISION="${GIT_VERSION##*.}"

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}


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
alias gus="g rm -r --cached"

# git add all
alias gaa="g add -A"


# git commit all
alias gca='gaa;gs;read;git commit'
compdef _git gca=git-commit


# git update
# gup [BRANCH] to update another branch
gup(){
	remembered_branch="$(current_branch)"

	if [ "$1" != "" ]
	then
		new_branch="$1"
	else
		new_branch=$remembered_branch
	fi

	echo "switching to branch ${new_branch}"
	git checkout $new_branch

	echo "fetch and rebase"
	git fetch -p
	git rebase

	echo "bundle install"
	bundle install

	echo "rake db:migrate"
	rdbm

	echo "switch to original branch: $remembered_branch"
	git checkout $remembered_branch
}

alias gup='git fetch -p && git rebase'
compdef _git gup=git-rebase
alias gp='git push'
compdef _git gp=git-push
alias gb='git branch'
compdef _git gb=git-branch
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# git branch clean
# removes local branches if already merged into master
deleteRemoteBranch() { g push origin --delete $1; g branch -D $1 };
gbc() {
	git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
	for b in `g branch  -r --merged`; do echo "Delete $b? y or any key"; doit=read; $doit -eq "y" && deleteRemoteBranch ${b#origin/##}; done
}


# commit to different branch and rebase back
gcab() {
	remembered_branch="$(current_branch)"
	git stash

	if [ "$1" != "" ]
	then
		commit_branch="$1"
	else
		commit_branch="master"
	fi

	git checkout $commit_branch
	git stash pop
	gca
	git checkout $remembered_branch
	git rebase $commit_branch
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


gdv() { git-diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
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

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git
