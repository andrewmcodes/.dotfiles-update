#!/usr/bin/env zsh

##
# Commands, funtions and aliases
#
# Always set aliases _last,_ so they don't class with function definitions.
#

# These aliases enable us to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
alias %= \$=

# Bat
alias cat="bat"

# Git
alias g='git'
alias gco='git checkout'
alias gm='git checkout main'
alias gl='git pull'
alias gs='git status'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gup='git pull --rebase'
alias gc='git commit'
alias gcm='git commit -m'
alias gci='git commit -m "chore: initial commit"'
alias gup='git pull --rebase'
alias gupm='git pull --rebase origin main'
alias grbc='git rebase --continue'

# VS Code
alias c='code .'

# Bundler
alias b='bundle'
alias be='bundle exec'

# Yarn
alias y='yarn'

# Redis
alias redis_start='redis-server --daemonize yes'

# Overmind
alias os="overmind start -f Procfile.andrew -D -p 3000 -P 1"
alias osf="overmind start -f Procfile.andrew -p 3000 -P 1"
alias oc="overmind connect"
alias ocw="overmind connect web"
alias ok="overmind kill"
alias oe="overmind echo"

# Nav
alias '~'='cd ~'
alias '..'='cd ..'
alias '...'='cd ...'
alias '....'='cd ....'

# Rails
alias rc="bin/rails c"
alias rs="bin/rails s"
alias rdbm="bin/rails db:migrate"
alias rt="bin/rails test"
alias up="git pull && bundle check || bundle && yarn && rails db:migrate"

# Heroku
alias hk="heroku"
alias hkc="heroku config"
alias hrc=" heroku run rails c"

# LS
alias la='ls -A'
alias l='ls -alFtr'
alias ls='ls -G'

# History
alias h='history | tail'
alias hg='history | grep'

# Diff
alias diff='diff --color'

# Grep
alias grep='grep --color'

# Ruby gems
alias {gi,gemi}='gem install'

# Bridgetown
alias bt='bin/bridgetown'

# Homebrew
alias bi='brew install'
alias {bic,bci}='brew install --cask'
alias bup='brew update && brew upgrade'
alias blc='brew list --cask'
alias bl='brew list'

# Shortcuts
alias sr='shortcuts run'

# Znap
alias zr='znap restart'

# JSON
alias jason='pbpaste -Prefer txt | jq . | pbcopy'

# `:` is a builtin command that does nothing. We use it here to stop Zsh from
# evaluating the value of our $expansion as a command.
: ${PAGER:='code --wait'}

# Associate file .extensions with programs.
# This lets you open a file just by typing its name and pressing enter.
# Note that the dot is implicit. So, `gz` below stands for files ending in .gz
alias -s {css,gradle,html,js,json,md,patch,properties,txt,xml,yml}=$PAGER
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'

# Use `< file` to quickly view the contents of any file.
READNULLCMD=$PAGER

# Print the number of characters in the PATH variable
# echo $PATH | wc -c

# Safer alternatives to `rm`
if [[ $VENDOR == apple ]]; then
  trash() {
    local -aU items=( $^@(N) )
    local -aU missing=( ${@:|items} )
    (( $#missing )) &&
        print -u2 "trash: no such file(s): $missing"
    (( $#items )) ||
        return 66
    print Moving $( eval ls -d -- ${(q)items[@]%/} ) to Trash.
    items=( '(POSIX file "'${^items[@]:a}'")' )
    osascript -e 'tell application "Finder" to delete every item of {'${(j:, :)items}'}' \
        > /dev/null
  }
fi
