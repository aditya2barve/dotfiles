# using PowerShell 7.1.3

# use shortcut 'j' for ZLocation
Set-Alias -Name j -Value Invoke-ZLocation

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

# customize prompt
# ref: https://scriptim.github.io/bash-prompt-generator/
function Prompt {
    $lastCommandFailed = !$?
    $ESC = [char]27
    $promptString = ""

    if ($lastCommandFailed) {
        $promptString += "🔥"
    }

    # Fg = foreground (text color), Bg = background
    $blackFg = "$ESC[30m"
    $cyanBg = "$ESC[46m"
    $greenBg = "$ESC[42m"
    $redBg = "$ESC[101m"
    $resetColor = "$ESC[0m"

    # add timestamp
    $timestamp = Get-Date -Format "HH:mm:ss tt"
    $promptString += "$blackFg$cyanBg $timestamp $resetColor"

    # add git branch
    $gitStatusOutput = git status 2>&1
    if ($gitStatusOutput -match "fatal: not a git repository") {
        # no op
    }
    elseif ($gitStatusOutput -match "HEAD detached") {
        $promptString += "$blackFg$redBg HEAD detached $resetColor"
    }
    else {
        $branch = git branch --show
        $lastBranchPiece = ($branch -split "/")[-1]
        $promptString += "$blackFg$GreenBg $lastBranchPiece $resetColor"
    }

    # add current directory
    $currentDirectory = (Get-Location).Path.Split('/')[-1]
    $promptString += " $currentDirectory "

    $promptString += "$ "

    $promptString
}

function venv {
    param (
        [string]
        $environmentName = "myenv"
    )

    if (!$null -eq $env:VIRTUAL_ENV) {
        Write-Host "virtualenv is already active: $VIRTUAL_ENV"
        return
    }

    if (!(Test-Path $environmentName -PathType Container)) {
        Write-Host "creating virtual environment."
        python3 -m venv $environmentName
    }

    . "$environmentName/bin/Activate.ps1"
}

function watch {
    param (
        [string]
        $Command = "Get-Date",
        [int]
        $Interval = 2
    )

    while ($true) {
        Clear-Host
        Invoke-Expression $Command
        Start-Sleep -Seconds $Interval
    }
}
