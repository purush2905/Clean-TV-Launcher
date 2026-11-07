# Standalone restore script for Xiaomi A Series 32" 2025 (MiTV-AXFU0)
param(
    [string]$TvHost = "192.168.1.103:5555"
)
$ErrorActionPreference = 'Continue'
$pkgs = @(
    "com.miui.tv.analytics",
    "com.xiaomi.statistic",
    "com.xiaomi.tvqs.overseas.y24",
    "com.google.android.feedback",
    "com.mitv.tvhome.atv",
    "com.mitv.tvhome.michannel",
    "com.mitv.tvhome.mitvplus",
    "com.mitv.tvhome.oemtab",
    "com.xm.webcontent",
    "android.autoinstalls.config.soc.amlogic",
    "com.graymatrix.did",
    "com.android.adservices.api",
    "com.xiaomi.mitv.tvmanager",
    "com.mitv.toolhouse",
    "com.xiaomi.mitv.detection",
    "com.xiaomi.mitv.manualhelp",
    "com.xiaomo.tv.milegal",
    "com.google.android.play.games",
    "com.xiaomi.mimusic2",
    "com.xiaomi.mitv.smartshare",
    "com.xiaomi.wfdsinkhelperservice",
    "com.xiaomi.mi_connect_service",
    "com.xiaomi.mitv.updateservice",
    "com.mitv.upgrader",
    "com.mitv.ABUpdateStatus",
    "com.droidlogic.updater",
    "com.amazon.amazonvideo.livingroom",
    "com.sonyliv",
    "com.netflix.ninja",
    "com.netflix.tokenmanager",
    "com.mitv.overseaservice",
    "com.xiaomi.android.tvsetup.partnercustomizer",
    "com.mitv.setup",
    "com.android.tv.feedbackconsent",
    "com.google.android.partnersetup",
    "com.google.android.tungsten.setupwraith",
    "com.google.android.apps.tv.launcherx",
    "com.mitv.livetv",
    "com.mitv.livetv.it",
    "com.mitv.livetv.ci_mediatek",
    "com.android.printspooler",
    "com.android.healthconnect.controller",
    "com.android.health.connect.backuprestore",
    "com.android.settings.intelligence",
    "com.xiaomi.mitv.scenemode",
    "com.google.android.syncadapters.calendar",
    "com.android.providers.calendar",
    "com.android.providers.contacts",
    "com.android.providers.userdictionary",
    "com.android.hotspot2.osulogin",
    "com.android.ondevicepersonalization.services",
    "com.android.federatedcompute.services",
    "com.android.companiondevicemanager",
    "com.android.cts.ctsshim",
    "com.android.cts.priv.ctsshim",
    "com.google.android.marvin.talkback"
)

Write-Host "Re-enabling packages on $TvHost..."
foreach ($p in $pkgs) {
    adb -s $TvHost shell "pm enable --user 0 $p"
}

Write-Host "Restoring stock Google TV launcher..."
adb -s $TvHost shell "cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/com.google.android.apps.tv.launcherx.home.HomeActivity"

Write-Host "Restoring default DNS..."
adb -s $TvHost shell "settings put global private_dns_mode opportunistic"

Write-Host "Restore finished!"
