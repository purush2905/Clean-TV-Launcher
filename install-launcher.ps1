# CleanYourTV - Xiaomi MiTV-AXFU0 Launcher Installer (PowerShell)
$ErrorActionPreference = "Stop"

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  CleanYourTV - Xiaomi MiTV-AXFU0 Launcher Installer" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$apk = Join-Path $PSScriptRoot "cleanyourtv-release.apk"

if (-not (Test-Path $apk)) {
    Write-Error "Error: $apk not found!"
    exit 1
}

Write-Host "Checking ADB connection..." -ForegroundColor Yellow
adb devices

Write-Host "Pushing APK to TV..." -ForegroundColor Yellow
adb push $apk /data/local/tmp/cleanyourtv.apk

Write-Host "Installing / updating launcher..." -ForegroundColor Yellow
adb shell pm install -r /data/local/tmp/cleanyourtv.apk

Write-Host "Launching CleanYourTV Home..." -ForegroundColor Yellow
adb shell am start -n com.gathin.tvhome/.MainActivity

Write-Host ""
Write-Host "CleanYourTV launcher installed and active!" -ForegroundColor Green
