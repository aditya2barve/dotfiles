Import-Module ZLocation

$EntryProfilePath = "$PSScriptRoot/commands.ps1"
Write-Host "load start: $EntryProfilePath"
. $EntryProfilePath
Write-Host "load complete: $EntryProfilePath"
