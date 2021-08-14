function Test-CommandExists {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $Command
    )

    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = ‘SilentlyContinue’

    $exists = [boolean](Get-Command $Command)

    $ErrorActionPreference=$oldPreference

    return $exists
}