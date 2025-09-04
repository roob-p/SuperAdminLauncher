$NewPath = Join-Path -Path $PSScriptRoot -ChildPath "PATH"

$CurrentPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")

$PathList = $CurrentPath -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

if ($PathList -notcontains $NewPath) {
    if ([string]::IsNullOrEmpty($CurrentPath)) {
        $UpdatedPath = "$NewPath;"
    }
    else {
        $UpdatedPath = "$CurrentPath$NewPath;"
    }

    [System.Environment]::SetEnvironmentVariable("PATH", $UpdatedPath, "User")

    Write-Host "Added '$NewPath;' to User PATH."
}
else {
    Write-Host "'$NewPath' is already present in User PATH."
}

