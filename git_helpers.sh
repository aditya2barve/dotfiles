#!/bin/bash

alias ga="git add"
alias gcu="git reset HEAD~1"
alias gd="git diff"
alias gdd="git difftool"
alias gl="git log --stat"
alias gll="git log -1 --stat"
alias glo="git log -20 --oneline"
alias gs="git status"

function gch() {
    branch=$(git branch | fzf | sed 's/^..//')
    git checkout $branch
}

# git commit
# $@ is optional commit message
function gc() {
    message="$@"
    git commit -m "${message:-update}"
}

# git commit all
# $@ is optional commit message
function gca() {
    git add -A
    gc $@
}

# git commit all and push. useful for quick fixes.
# $@ is optional commit message
function gcp() {
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

# $1 is branch name without prefix
function branch() {
    git checkout master
    branch_here $1
}

# checkout master; pull; rebase current branch onto master
function rebase() {
    current_branch=`git branch --show-current`
    git checkout master
    git pull
    git checkout $current_branch
    git rebase master
}

function rpnew() {
    cd ~/repos
    [ -d "$1" ] && echo "repo already exists" && exit 1
    git init $1
    cd $1
    gh repo create $1 --confirm --private
    echo "# $1" > README.md
    git add README.md
    git commit -m 'initial commit'
    git push --set-upstream origin master
}

function rpshow() {
    url=`git remote get-url origin`
    open_in_browser $url
}

