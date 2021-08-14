function watch {
    param (
        [string]
        $Command = "Get-Date",
        [int]
        $Interval = 2
    )

    while ($true) {
        Clear-Host
        Invoke-Expression $Command
        Start-Sleep -Seconds $Interval
    }
}
