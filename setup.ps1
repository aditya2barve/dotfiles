# install dependencies
Write-Host "Installing dependencies. This might take a few minutes."
Install-Module ZLocation -Scope CurrentUser -Force
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Write-Host "Finished installing dependencies."

# add entrypoint.ps1 to profile
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
