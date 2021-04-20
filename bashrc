#!/bin/bash

export DOTFILES=~/repos/dotfiles

[ -f $DOTFILES/utils.sh ] && source $DOTFILES/utils.sh
[ -f $DOTFILES/git_helpers.sh ] && source $DOTFILES/git_helpers.sh
