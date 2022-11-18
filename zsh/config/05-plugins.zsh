#!/usr/bin/env zsh

##
# Plugins
#

# Add the plugins you want to use here.
# For more info each plugin, visit its repo on github.com/<plugin>
# -a sets the variable's type to array.
local -a plugins=(
  asdf-vm/asdf
  marlonrichert/zsh-autocomplete    # Real-time type-ahead completion
  agkozak/zsh-z                     # Quickly jump to previously visited directories.
  marlonrichert/zsh-hist            # Edit history from the command line.
  marlonrichert/zcolors             # Colors for completions and Git
  zsh-users/zsh-autosuggestions     # Inline suggestions
  zsh-users/zsh-syntax-highlighting # Command-line syntax highlighting
)

# https://github.com/marlonrichert/zsh-autocomplete/blob/main/.zshrc
zstyle ':autocomplete:*' min-input 1

# Speed up the first startup by cloning all plugins in parallel.
# This won't clone plugins that we already have.
znap clone $plugins

# Load each plugin, one at a time.
local p=
for p in $plugins; do
  znap source $p
done

autoload -Uz pg_switch
autoload -Uz init
autoload -Uz mkcd
autoload -Uz toggle_desktop_icons
autoload -Uz ghlabels

# export GPG_TTY=$(tty)

# `znap eval <name> '<command>'` is like `eval "$( <command> )"` but with
# caching and compilation of <command>'s output, making it ~10 times faster.
znap eval zcolors zcolors

znap function _fuck fuck 'eval "$(thefuck --alias)"'
compctl -K _fuck fuck

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"
