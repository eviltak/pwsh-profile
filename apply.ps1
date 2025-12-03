# Symlink komorebi config files into USERPROFILE
$komorebiFiles = @('komorebi.bar.json', 'komorebi.json')
foreach ($file in $komorebiFiles) {
    $source = Join-Path $PSScriptRoot $file
    $target = Join-Path $env:USERPROFILE $file
    if (Test-Path $target) { Remove-Item $target -Force }
    New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
}

# Symlink whkdrc into ~/.config
$configDir = Join-Path $env:USERPROFILE '.config'
if (!(Test-Path $configDir)) { New-Item -ItemType Directory -Path $configDir | Out-Null }
$whkdrcSource = Join-Path $PSScriptRoot 'whkdrc'
$whkdrcTarget = Join-Path $configDir 'whkdrc'
if (Test-Path $whkdrcTarget) { Remove-Item $whkdrcTarget -Force }
New-Item -ItemType SymbolicLink -Path $whkdrcTarget -Target $whkdrcSource | Out-Null

# Ensure $PROFILE sources pwsh-profile\profile.ps1 using $PSScriptRoot
$profileSourceLine = ". '$PSScriptRoot\\profile.ps1'"
if (!(Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}
Set-Content -Path $PROFILE -Value $profileSourceLine
