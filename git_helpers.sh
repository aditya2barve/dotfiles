#!/bin/bash

alias ga="git add"
alias gcu="git reset HEAD~1"
alias gd="git diff"
alias gl="git log"
alias gll="git log -1 HEAD"
alias glo="git log -20 --oneline"
alias gs="git status"

function gc() {
    message="$@"
    git commit -m "${message:-update}"
}

function gca() {
    git add -A
    gc $@
}

function gcp() {
    gca $@
    git push
}

function branch_here() {
    username=`git config user.email | cut -d '@' -f 1`
    full_branch_name=users/$username/$1
    git checkout -b $full_branch_name
    git push --set-upstream origin $full_branch_name
}

function branch() {
    git checkout master
    branch_here $1
}

function rebase() {
    current_branch=`git branch --show-current`
    git checkout master
    git pull
    git checkout $current_branch
    git rebase master
}

