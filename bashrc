#!/bin/bash

export DOTFILES=~/repos/dotfiles
export RIPGREP_CONFIG_PATH=~/repos/dotfiles/ripgreprc
export EDITOR=vim

export HISTSIZE=10000
export HISTCONTROL=ignoreboth

[ -f $DOTFILES/utils.sh ] && source $DOTFILES/utils.sh
[ -f $DOTFILES/git_helpers.sh ] && source $DOTFILES/git_helpers.sh
[ -f $DOTFILES/.fzf.bash ] && source ~/.fzf.bash

alias python='python3'
alias pip='python -m pip'

alias cfb="vim ~/.bashrc"
alias cfv="vim ~/.vimrc"

alias l="ls"
alias ..="cd .."

# Setting ripgrep as the default source for fzf
# reference for --no-require-git: https://stackoverflow.com/questions/60934191/gitignore-node-modules-not-working-for-fd-and-ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-require-git'
export FZF_DEFAULT_OPTS='-m --height 20% --border'

