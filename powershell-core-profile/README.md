# dotfiles

## Prerequisites

### PowerShell Core (PowerShell 7)

Instructions: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1

### [ZLocation](https://github.com/vors/ZLocation) module for PowerShell

Install in Powershell.
```powershell
Install-Module ZLocation -Scope CurrentUser
```

### [Az module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.3.0) for PowerShell

Install in Powershell.
```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

## Installation

git clone {repo}

Run setup in Powershell.
```powershell
cd {repo}\powershell-core-profile\
.\setup.ps1
```
