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
