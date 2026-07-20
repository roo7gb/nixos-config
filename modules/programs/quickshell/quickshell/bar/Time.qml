pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  readonly property string timeStr: {
    Qt.formatDateTime(clock.date, "hh:mm")
  }

  readonly property string dateStr: {
    Qt.formatDateTime(clock.date, "ddd MMM d")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}

