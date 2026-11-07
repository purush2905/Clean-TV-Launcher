@echo off
echo ===================================================
echo Xiaomi A Series 32" 2025 (MiTV-AXFU0) Restore Tool
echo ===================================================
set TV_IP=192.168.1.103:5555

echo Re-enabling all debloated packages...
adb -s %TV_IP% shell pm enable --user 0 com.miui.tv.analytics
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.statistic
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.tvqs.overseas.y24
adb -s %TV_IP% shell pm enable --user 0 com.google.android.feedback
adb -s %TV_IP% shell pm enable --user 0 com.mitv.tvhome.atv
adb -s %TV_IP% shell pm enable --user 0 com.mitv.tvhome.michannel
adb -s %TV_IP% shell pm enable --user 0 com.mitv.tvhome.mitvplus
adb -s %TV_IP% shell pm enable --user 0 com.mitv.tvhome.oemtab
adb -s %TV_IP% shell pm enable --user 0 com.xm.webcontent
adb -s %TV_IP% shell pm enable --user 0 android.autoinstalls.config.soc.amlogic
adb -s %TV_IP% shell pm enable --user 0 com.graymatrix.did
adb -s %TV_IP% shell pm enable --user 0 com.android.adservices.api
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mitv.tvmanager
adb -s %TV_IP% shell pm enable --user 0 com.mitv.toolhouse
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mitv.detection
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mitv.manualhelp
adb -s %TV_IP% shell pm enable --user 0 com.xiaomo.tv.milegal
adb -s %TV_IP% shell pm enable --user 0 com.google.android.play.games
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mimusic2
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mitv.smartshare
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.wfdsinkhelperservice
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mi_connect_service
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.mitv.updateservice
adb -s %TV_IP% shell pm enable --user 0 com.mitv.upgrader
adb -s %TV_IP% shell pm enable --user 0 com.mitv.ABUpdateStatus
adb -s %TV_IP% shell pm enable --user 0 com.droidlogic.updater
adb -s %TV_IP% shell pm enable --user 0 com.amazon.amazonvideo.livingroom
adb -s %TV_IP% shell pm enable --user 0 com.sonyliv
adb -s %TV_IP% shell pm enable --user 0 com.netflix.ninja
adb -s %TV_IP% shell pm enable --user 0 com.netflix.tokenmanager
adb -s %TV_IP% shell pm enable --user 0 com.mitv.overseaservice
adb -s %TV_IP% shell pm enable --user 0 com.xiaomi.android.tvsetup.partnercustomizer
adb -s %TV_IP% shell pm enable --user 0 com.mitv.setup
adb -s %TV_IP% shell pm enable --user 0 com.android.tv.feedbackconsent
adb -s %TV_IP% shell pm enable --user 0 com.google.android.partnersetup
adb -s %TV_IP% shell pm enable --user 0 com.google.android.tungsten.setupwraith
adb -s %TV_IP% shell pm enable --user 0 com.google.android.apps.tv.launcherx
adb -s %TV_IP% shell pm enable --user 0 com.mitv.livetv
adb -s %TV_IP% shell pm enable --user 0 com.mitv.livetv.it
adb -s %TV_IP% shell pm enable --user 0 com.mitv.livetv.ci_mediatek
adb -s %TV_IP% shell pm enable --user 0 com.android.printspooler
adb -s %TV_IP% shell pm enable --user 0 com.android.healthconnect.controller
adb -s %TV_IP% shell pm enable --user 0 com.android.health.connect.backuprestore

echo Restoring stock launcher as default home...
adb -s %TV_IP% shell cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/com.google.android.apps.tv.launcherx.home.HomeActivity

echo Restoring Private DNS to opportunistic (default)...
adb -s %TV_IP% shell settings put global private_dns_mode opportunistic

echo Restore complete!
pause
