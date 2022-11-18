#!/usr/bin/env zsh
#
# This file, .zshenv, is the first file sourced by zsh for EACH shell, whether
# it's interactive or not.
# This includes non-interactive sub-shells!
# So, put as little in this file as possible, to avoid performance impact.
#
# Tell zsh where to look for our dotfiles.
# By default, Zsh will look for dotfiles in $HOME (and find this file), but
# once $ZDOTDIR is defined, it will start looking in that dir instead.
# ${X:=Y} specifies a default value Y to use for parameter X, if X has not been
# set or is null. This will actually create X, if necessary, and assign the
# value to it.
# To set a default value that is returned *without* setting X, use ${X:-Y}
# As in other shells, ~ expands to $HOME _at the beginning of a value only._
ZDOTDIR=${XDG_CONFIG_HOME:=~/.dotfiles}/zsh

# These are used in /etc/zshrc
case $VENDOR in
  ( apple )
    export SHELL_SESSIONS_DISABLE=1
  ;;
  ( ubuntu )
    export skip_global_compinit=1
  ;;
esac
