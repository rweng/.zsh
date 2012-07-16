# Rails 3 aliases, backwards-compatible with Rails 2.

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:create db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rp='_rails_command plugin'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias r="rails"
alias tlog='tail -f log/development.log'
alias rst='touch tmp/restart.txt'
alias rake_db_migrate_both="rake db:migrate && rake db:migrate RAILS_ENV=test"
alias kicker="be kicker -r rails -b 'spin push'"
