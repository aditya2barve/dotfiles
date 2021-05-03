#!/bin/bash

export REPOS_DIR=~/repos
function gr() {
    repo_name=$(ls $REPOS_DIR | fzf)
    cd $REPOS_DIR/$repo_name
}

export DOTFILES=~/repos/dotfiles
export RIPGREP_CONFIG_PATH=~/repos/dotfiles/ripgreprc
export EDITOR=vim

export HISTSIZE=10000
export HISTCONTROL=ignoreboth

[ -f $DOTFILES/utils.sh ] && source $DOTFILES/utils.sh
[ -f $DOTFILES/git_helpers.sh ] && source $DOTFILES/git_helpers.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias python="python3"
alias pip="python -m pip"

alias cfb="vim ~/.bashrc"
alias cfv="vim ~/.vimrc"
alias v="vim"

alias l="ls"
alias ll="ls -al"
alias ..="cd .."

# show file tree without gitignored files
# requires tree 1.8
# install from: https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/tree_1.8.0-1_amd64.deb.html
alias fern="rg --files | tree --fromfile"

# Setting ripgrep as the default source for fzf
# reference for --no-require-git: https://stackoverflow.com/questions/60934191/gitignore-node-modules-not-working-for-fd-and-ripgrep
export FZF_DEFAULT_COMMAND="rg --files --no-require-git"
export FZF_DEFAULT_OPTS="-m --height 20% --border"

function venv() {
    if [ ! -z $VIRTUAL_ENV ]; then
        echo "virtualenv is already active: $VIRTUAL_ENV"
        return
    fi
    env_name=${1:-myenv}
    [ -d $env_name ] || virtualenv $env_name
    source $env_name/bin/activate
}

# customize prompt
function prompt_horizontal_line() {
    printf %$(tput cols)s | tr " " "-"
}
function prompt_is_on_fire() {
    [ $1 != 0 ] && echo 🔥
}
function prompt_timestamp() {
    echo -e "\e[0;97;46m $(date +"%T") \e[0m"
}
function prompt_git_branch() {
    branch=$(git branch --show 2> /dev/null)
    if [ branch != '' ]; then
        echo -e "\e[0;97;43m $branch \e[0m"
    fi
}
function generate_prompt() {
    last_exit_code=$?
    line=`prompt_horizontal_line`
    fire=`prompt_is_on_fire $last_exit_code`
    timestamp=`prompt_timestamp`
    branch=`prompt_git_branch`
    echo -e "$line\n$fire$timestamp$branch `pwd`\n$ "
}
PS1='$(generate_prompt)'

