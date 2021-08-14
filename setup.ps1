$setupLine = ". $PSScriptRoot/src/entrypoint.ps1"
$profileFile = $PROFILE.CurrentUserAllHosts

if ((Get-Content -Path $profileFile) -match $setupLine) {
    Write-Host "Profile already contains setup line."
}
else {
    Write-Host "Adding setup line to profile."
    Add-Content -Path $profileFile -Value $setupLine
}

Write-Host "Setup complete."
