Write-Host "Installing dependencies. This might take a few minutes."

if (Get-InstalledModule | where -Property Name -eq ZLocation) {
    Write-Host "ZLocation already installed."
}
else {
    Write-Host "Installing ZLocation."
    Install-Module ZLocation -Scope CurrentUser -Repository PSGallery -Force
    Write-Host "Finished installing ZLocation."
}

if (Get-InstalledModule | where -Property Name -eq Az) {
    Write-Host "Az already installed."
}
else {
    Write-Host "Installing Az."
    Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
    Write-Host "Finished installing Az."
}

Write-Host -ForegroundColor DarkGreen "Finished installing dependencies.`n"

$setupLine = ". $PSScriptRoot/src/entrypoint.ps1"
$profileFile = $PROFILE.CurrentUserAllHosts
Write-Host "Updating profile at $profileFile."

if ((Get-Content -Path $profileFile) -match $setupLine) {
    Write-Host "Profile already contains entrypoint.ps1."
}
else {
    Write-Host "Adding entrypoint.ps1 to profile."
    Add-Content -Path $profileFile -Value $setupLine
}
Write-Host -ForegroundColor DarkGreen "Finished updating profile.`n"

Write-Host "Setup complete."
