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

