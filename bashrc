#!/bin/bash

export DOTFILES=~/repos/dotfiles
export RIPGREP_CONFIG_PATH=~/repos/dotfiles/ripgreprc

[ -f $DOTFILES/utils.sh ] && source $DOTFILES/utils.sh
[ -f $DOTFILES/git_helpers.sh ] && source $DOTFILES/git_helpers.sh

