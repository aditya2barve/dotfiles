function venv {
    param (
        [string]
        $environmentName = "myenv"
    )

    if (!$null -eq $env:VIRTUAL_ENV) {
        Write-Host "virtualenv is already active: $VIRTUAL_ENV"
        return
    }

    if (!(Test-Path $environmentName -PathType Container)) {
        Write-Host "creating virtual environment."
        python3 -m venv $environmentName
    }

    . "$environmentName/bin/Activate.ps1"
}
