if command_exists mate; then
	export EDITOR='mate -w'
elif command_exists mvim; then
	export EDITOR='mvim'
else
	export EDITOR='vim'	
fi
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