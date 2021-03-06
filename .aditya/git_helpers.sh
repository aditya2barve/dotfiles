#!/bin/bash

alias ga="git add"
alias gcu="git reset HEAD~1"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdd="git difftool"
alias gl="git log --stat"
alias gll="git log -1 --stat"
alias glo="git log -20 --oneline"
alias gs="git status"
# git watch
alias gw="watch --color -x bash -i -c 'gsd'"
# added -i flag for bash above based on:
# https://unix.stackexchange.com/questions/101620/how-to-load-bashrc-from-bash-c

function horizontal_line() {
    printf %$(tput cols)s\\n |tr " " "-"
}

# git status and diff with color
function gsd() {
    horizontal_line
    git -c color.status=always status --short
    horizontal_line
    git diff --color
    horizontal_line
}

function gch() {
    branch=$(git branch | fzf | sed 's/^..//')
    git checkout $branch
}

# git commit inspect
# $1 is commit reference (e.g. commit hash or branch name)
function gci() {
    git show --color -p $1
}

# git commit
# $@ is optional commit message
function gc() {
    message="$@"
    git commit -m "${message:-update}"
}

# git commit all tracked files and push. useful for quick fixes.
# note: excludes untracked files
# $@ is optional commit message
function gcp() {
    git add --update
    gc $@
    git push
}

# git commit all
# $@ is optional commit message
function gca() {
    git add -A
    gc $@
}

# git commit all and push. useful for quick fixes.
# note: includes untracked files
# $@ is optional commit message
function gcap() {
    gca $@
    git push
}

# $1 is branch name without prefix
function branch_here() {
    username=`git config user.email | cut -d '@' -f 1`
    full_branch_name=users/$username/$1
    git checkout -b $full_branch_name
    git push --set-upstream origin $full_branch_name
}

function get_default_branch_name() {
    if git branch --all | grep -q master; then
        echo master
    elif git branch --all | grep -q main; then
        echo main
    fi
}

# $1 is branch name without prefix
function branch() {
    git checkout `get_default_branch_name`
    branch_here $1
}

# checkout master; pull; rebase current branch onto master
function rebase() {
    current_branch=`git branch --show-current`
    git checkout `get_default_branch_name`
    git pull
    git checkout $current_branch
    git rebase `get_default_branch_name`
}

config=$REPOS_DIR/dotfiles/config.sh
[ -f $config ] && source $config

if [ -z "$GIT_HOSTING_SERVICE" ]; then
    echo "warning: git hosting service not defined"
elif [ $GIT_HOSTING_SERVICE = 'GitHub' ]; then
    helper=$REPOS_DIR/dotfiles/github_helpers.sh
    [ -f $helper ] && source $helper
elif [ $GIT_HOSTING_SERVICE = 'AzureDevOps' ]; then
    helper=$REPOS_DIR/dotfiles/azure_devops_helpers.sh
    [ -f $helper ] && source $helper
fi
