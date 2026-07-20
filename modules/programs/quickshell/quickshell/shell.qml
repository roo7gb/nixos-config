// @ pragma UseQApplication
// @ pragma Env QT_QPA_PLATFORMTHEME=gtk3
// @ pragma Env QS_NO_RELOAD_POPUP=1
// @ pragma Env QSG_RENDER_LOOP=threaded
// @ pragma Env QT_QUICK_FLICKABLE_WHEEL_DECELERATION=10000

import Quickshell
import Quickshell.Io
import QtQuick
import "bar"
import "launcher"
import "notifs"
import "osd"

Scope {
  Bar { theme: DefaultTheme {} }
  AppLauncher { theme: DefaultTheme{} }
  NotificationPopup { theme: DefaultTheme {} }
  OSD { theme: DefaultTheme {} }
}
