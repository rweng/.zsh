# must be set after rvm
# PATH variables should not end with a /
echo "env_vars"
# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# node
export PATH="$PATH:/usr/local/share/npm/bin"
# home bin dir
export PATH="$HOME/.bin:$PATH"

export EDITOR='subl'
# VISUAL should usually be set to the same value as EDITOR
export VISUAL=$EDITOR
	
# LANG is required by some programs, like ruby, so ensure that it is set (to UTF)
export LANG=en_US.UTF-8
export HOSTNAME=`hostname -s`

# think this works only on mac
if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_HOME="`/usr/libexec/java_home`"
fi

# for IntelliJ IDEA
export IDEA_JDK="$JAVA_HOME"

export LC_ALL=en_US.UTF-8

export GISTY_DIR=$HOME/code/gists