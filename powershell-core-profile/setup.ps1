$setupAlreadyExists = (Get-Content -Path $PROFILE.CurrentUserAllHosts) -match "commands.ps1"
if (!$setupAlreadyExists) {
    Get-Content -Path ./appendToProfile.ps1 | Add-Content -Path $PROFILE.CurrentUserAllHosts
    Write-Host "appended to profile."
}
else {
    Write-Host "setup already exists."
}
