# Xiaomi A Series 32" (2025) Debloat & Apple TV Launcher Guide

- **Model:** Xiaomi A series 32" (MiTV-AXFU0)
- **Codename:** `arctictale` (Amlogic)
- **OS:** Android 14 (Google TV, API 34)
- **Firmware:** `UKG3.241124.001.V816.0.26.9.16.UXFAATV`
- **Device IP:** `192.168.1.106:5555`

---

## 1. What Was Debloated

Packages were safely disabled for user 0 (`pm disable-user --user 0`), never uninstalled.

- **Manufacturer Telemetry & Tracking:**
  - `com.miui.tv.analytics`
  - `com.xiaomi.statistic`
  - `com.xiaomi.tvqs.overseas.y24`
  - `com.google.android.feedback`

- **PatchWall & Ads:**
  - `com.mitv.tvhome.atv` (PatchWall)
  - `com.mitv.tvhome.michannel`
  - `com.mitv.tvhome.mitvplus` (Xiaomi TV+ FAST channels)
  - `com.mitv.tvhome.oemtab` (Mi Home tab)
  - `com.xm.webcontent`
  - `android.autoinstalls.config.soc.amlogic`
  - `com.graymatrix.did`
  - `com.android.adservices.api`

- **Background Utilities & Duplicates:**
  - `com.xiaomi.mitv.tvmanager` (TV Cleaner / RAM booster)
  - `com.mitv.toolhouse`
  - `com.xiaomi.mitv.detection`
  - `com.xiaomi.mitv.manualhelp`
  - `com.xiaomo.tv.milegal`
  - `com.google.android.play.games`
  - `com.xiaomi.mimusic2`

- **Unused Miracast / Screen Share & System Updaters:**
  - `com.xiaomi.mitv.smartshare`
  - `com.xiaomi.wfdsinkhelperservice`
  - `com.xiaomi.mi_connect_service`
  - `com.xiaomi.mitv.updateservice`
  - `com.mitv.upgrader`
  - `com.mitv.ABUpdateStatus`
  - `com.droidlogic.updater`

- **Unwanted Streaming Apps (User Selection):**
  - `com.amazon.amazonvideo.livingroom` (Prime Video)
  - `com.sonyliv` (Sony LIV)
  - `com.netflix.ninja` (Netflix)
  - `com.netflix.tokenmanager`

- **Essential TV Components Kept (Never Modified):**
  - TV Inputs / HDMI: `com.mitv.livetv`, `com.mitv.livetv.it`, `mitv.service`, `com.mitv.overseaservice`, `com.droidlogic.tvinput`
  - Remote / Bluetooth: `com.mi.bluetooth`, `com.android.bluetooth`, `com.google.android.tv.remote.service`
  - On-screen Keyboard: `com.google.android.inputmethod.latin` (Gboard)
  - Google Play Services & Store: `com.android.vending`, `com.google.android.gms`, `com.google.android.gsf`
  - Active apps: YouTube, YouTube Music, Disney+ Hotstar, Google Assistant, Chromecast built-in

---

## 2. Restoring Apps

### Re-enable any individual app
Run via ADB:
```powershell
adb -s 192.168.1.106:5555 shell pm enable --user 0 <package_name>
```
*Example for Prime Video:*
```powershell
adb -s 192.168.1.106:5555 shell pm enable --user 0 com.amazon.amazonvideo.livingroom
```

### Full Restore
To restore all apps and return to the stock Google TV launcher:
- Double click `restore-tv.bat`
- Or run in PowerShell: `.\restore-tv.ps1`

---

## 3. Changing Dock Order and Wallpaper

The launcher configuration is located in `launcher/app/src/main/res/values/config.xml` and can also be styled dynamically with themes.

### Changing Dock Apps
In `launcher/app/src/main/res/values/config.xml`:
```xml
<string-array name="dock_apps">
    <item>com.google.android.youtube.tv</item>
    <item>in.startv.hotstar</item>
    <item>com.google.android.youtube.tvmusic</item>
    <item>com.mitv.livetv</item>
</string-array>
```

### Pushing a Custom Wallpaper or Theme
Use `tools\theme.ps1`:
```powershell
powershell -ExecutionPolicy Bypass -File tools\theme.ps1 -TvHost 192.168.1.106 themes\glass
```
To return to the default pitch-black clean Apple TV theme:
```powershell
powershell -ExecutionPolicy Bypass -File tools\theme.ps1 -TvHost 192.168.1.106 --reset
```

---

## 4. Private DNS (Ad & Tracker Blocking)

Private DNS is set to AdGuard (`dns.adguard-dns.com`).
*Note: Private DNS blocks tracker and ad network domains across apps and the system; it does not block YouTube video ads (which are served directly from YouTube video stream domains).*

### Revert to Default Network DNS:
```powershell
adb -s 192.168.1.106:5555 shell settings put global private_dns_mode opportunistic
```
