fpath=($ZSH/plugins/bundler $fpath)
autoload -U compinit
compinit -i

# alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias bs="bundle show"
# open bundle in Rubymine
be(){
  mine `bundle show $1`
}



# The following is based on https://github.com/gma/bundler-exec
bundled_commands=(cap capify jekyll cucumber foreman guard nanoc rackup rainbows rake rspec shotgun spec spork thin unicorn unicorn_rails rails autotest)

## Functions

_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=$PWD
  while [ "$(dirname $check_dir)" != "/" ]; do
    [ -f "$check_dir/Gemfile" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-bundler() {
  if _bundler-installed && _within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

## Main program
for cmd in $bundled_commands; do
  eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"

  if [ $cmd="rake" ]; then
    alias $cmd="noglob bundled_$cmd"
  else
    alias $cmd=bundled_$cmd
  fi

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd bundled_$cmd=$cmd
  fi
done
