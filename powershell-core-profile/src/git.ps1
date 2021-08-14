# git shortcuts
# ref: https://stackoverflow.com/questions/2858484/creating-aliases-in-powershell-for-git-commands
function ga { & git add $args }
function gcu { & git reset HEAD~1 $args }
function gd { & git diff $args }
function gdd { & git difftool $args }
function gl { & git log --stat $args }
function gll { & git log -1 --stat $args }
function glo { & git log -20 --oneline $args }
function gs { & git status $args }
function gch { & git checkout $args }

function Get-GitDefaultBranch {
    $branches = git branch
    if ($branches -match "master") {
        "master"
    }
    elseif ($branches -match "main") {
        "main"
    }
    else {
        throw "Repository does not contain a branch named 'master' or 'main'. Could not determine default branch name."
    }
}

function Get-GitUsername {
    $email = git config user.email
    $username = ($email -split "@")[0]
    $username
}

function branch_here() {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $branchName
    )
    $full_branch_name = "users/$(Get-GitUsername)/$branchName"
    git checkout -b $full_branch_name
    git push --set-upstream origin $full_branch_name
}

function branch {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $branchName
    )
    git checkout $(Get-GitDefaultBranch) > $null
    branch_here $branchName
}

function rebase() {
    $master = $(Get-GitDefaultBranch)
    git checkout $master
    git pull origin $master
    git checkout -
    git rebase $master
}

function New-GitCommit() {
    param (
        [string]
        $Message
    )
    if ([string]::IsNullOrWhitespace($Message)) {
        $Message = "update"

    }
    git commit -m "$Message"
}
# override built-in alias gc -> Get-Content
Remove-Item alias:gc -Force
Set-Alias -Name gc -Value New-GitCommit

function gcp() {
    param (
        [string]
        $Message
    )
    git add --update
    New-GitCommit -Message "$Message"
    git push
}
