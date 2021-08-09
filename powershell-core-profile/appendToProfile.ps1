# https://github.com/vors/ZLocation
# installation: Install-Module ZLocation -Scope CurrentUser
Import-Module ZLocation

# TODO: Fill in profile path dynamically
$EntryProfilePath = "~/repos/dotfiles/powershell-core-profile/commands.ps1"
Write-Host "load start: $EntryProfilePath"
. $EntryProfilePath
Write-Host "load complete: $EntryProfilePath"
