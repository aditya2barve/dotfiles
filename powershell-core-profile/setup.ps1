$setupAlreadyExists = (Get-Content -Path $PROFILE.CurrentUserAllHosts) -match "commands.ps1"
if ($setupAlreadyExists) {
    Write-Host "setup already exists."
    return
}

Get-Content -Path ./appendToProfile.ps1 | Add-Content -Path $PROFILE.CurrentUserAllHosts
Write-Host "appended to profile."
