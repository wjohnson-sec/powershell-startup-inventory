# PowerShell Startup Program Inventory Script
# Gathers all startup items from registry and startup folders

Write-Host "`nCollecting startup program entries..." -ForegroundColor Cyan

$startupItems = @()

# Registry: Local Machine
$lmRun = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -ErrorAction SilentlyContinue
$lmRun.PSObject.Properties | ForEach-Object {
    $startupItems += [PSCustomObject]@{
        Location = "HKLM:Run"
        Name     = $_.Name
        Path     = $_.Value
    }
}

# Registry: Current User
$cuRun = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -ErrorAction SilentlyContinue
$cuRun.PSObject.Properties | ForEach-Object {
    $startupItems += [PSCustomObject]@{
        Location = "HKCU:Run"
        Name     = $_.Name
        Path     = $_.Value
    }
}

# Startup Folder: Current User
$startupPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
if (Test-Path $startupPath) {
    Get-ChildItem -Path $startupPath -File | ForEach-Object {
        $startupItems += [PSCustomObject]@{
            Location = "Startup Folder"
            Name     = $_.Name
            Path     = $_.FullName
        }
    }
}

# Output to CSV
$outputPath = "$env:USERPROFILE\Desktop\startup_programs.csv"
$startupItems | Export-Csv -Path $outputPath -NoTypeInformation

Write-Host "`nStartup program inventory saved to $outputPath" -ForegroundColor Green
