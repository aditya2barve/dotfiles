#!/bin/bash

export DOTFILES=~/repos/dotfiles
export RIPGREP_CONFIG_PATH=~/repos/dotfiles/ripgreprc
export EDITOR=vim

export HISTSIZE=10000
export HISTCONTROL=ignoreboth

[ -f $DOTFILES/utils.sh ] && source $DOTFILES/utils.sh
[ -f $DOTFILES/git_helpers.sh ] && source $DOTFILES/git_helpers.sh

alias python='python3'
alias pip='python -m pip'

alias cfb="vim ~/.bashrc"
alias cfv="vim ~/.vimrc"

alias l="ls"
alias ..="cd .."

