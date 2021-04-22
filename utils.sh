#!/bin/bash

function open_in_browser() {
    unameOut=$(uname -a)
    if [[ $unameOut == *WSL2* ]]; then
        # echo detected WSL2
        sensible-browser "$1"
        # if sensible-browser doesn't work, try this:
        # powershell.exe /c start $1
        return
    fi
    open -a firefox -g $1
}

