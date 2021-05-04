#!/bin/bash

function rpnew() {
    reposDir=~/repos
    cd $reposDir
    [ -d "$1" ] && echo "repo already exists in $reposDir" && return 1

    # create repo in azure devops and clone it
    org="https://dev.azure.com/adityabarve"
    project="prototypes"
    repo_json=`az repos create --org $org -p $project --name $1`
    remote_url=`echo $repo_json | jq -r '.remoteUrl'`
    git clone $remote_url

    cd "$1"
    echo "# $1" > README.md
    git add README.md
    git commit -m 'initial commit'
    git push --set-upstream origin master
}

function rpshow() {
    url=`git remote get-url origin | sed 's/[a-zA-Z0-9]*@//'`
    echo "opening $url in browser"
    open_in_browser "$url"
}

function prshow() {
    # find pull request id
    branch_name=`git branch --show-current`
    pr_id=`az repos pr list --query "[?sourceRefName=='refs/heads/$branch_name']" | jq '.[0].pullRequestId'`

    if [ $pr_id = null ]; then
        echo no PR found for current branch. creating one now.
        pr_id=`az repos pr create --draft true --title "$branch_name" | jq '.pullRequestId'` && az repos pr show --id $pr_id --open > /dev/null
    else
        az repos pr show --id $pr_id --open > /dev/null
    fi

}
