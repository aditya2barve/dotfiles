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

function prshow() {
    if ! gh pr view &> /dev/null
    then
        echo no PR found for current branch. creating one now.
        gh pr create --fill && gh pr view --web
    else
        gh pr view --web
    fi
}
