$Action = New-ScheduledTaskAction -Execute "$PSScriptRoot\Launcher.exe"
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable:$false
Register-ScheduledTask -Action $Action -Settings $Settings -TaskName 'SuperAdminLauncher' -User "$env:USERNAME" -RunLevel Highest -Force