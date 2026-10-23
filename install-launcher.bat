@echo off
setlocal
echo ========================================================
echo   CleanYourTV - Xiaomi MiTV-AXFU0 Launcher Installer
echo ========================================================
echo.

set APK=%~dp0cleanyourtv-release.apk

if not exist "%APK%" (
    echo Error: %APK% not found!
    pause
    exit /b 1
)

echo Checking ADB connection...
adb devices
echo.

echo Pushing APK to TV temporary storage...
adb push "%APK%" /data/local/tmp/cleanyourtv.apk
if errorlevel 1 (
    echo [FAIL] Could not push APK. Check ADB connection!
    pause
    exit /b 1
)

echo Installing / updating launcher...
adb shell pm install -r /data/local/tmp/cleanyourtv.apk
if errorlevel 1 (
    echo [FAIL] Installation failed!
    pause
    exit /b 1
)

echo.
echo Launching CleanYourTV Home...
adb shell am start -n com.gathin.tvhome/.MainActivity

echo.
echo ========================================================
echo   CleanYourTV launcher installed and active!
echo ========================================================
echo.
pause
