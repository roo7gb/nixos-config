import QtQuick

QtObject {
  readonly property color bgBase: "#151515"
  readonly property color bgSurface: "#161616"
  readonly property color bgOverlay: "#161616"
  readonly property color bgHover: "#242424"
  readonly property color bgSelected: "#4e4e4e"
  readonly property color bgBorder: "#151515"

  readonly property color textPrimary: "#dadada"
  readonly property color textSecondary: "#bcbcbc"
  readonly property color textMuted: "#5c5c5c"

  readonly property color accentPrimary: "#d6b471"
  readonly property color accentCyan: "#71bfd6"
  readonly property color accentGreen: "#8ed671"
  readonly property color accentOrange: "#d68571"
  readonly property color accentRed: "#d6717b"

  readonly property color urgencyLow: textMuted
  readonly property color urgencyNormal: accentPrimary
  readonly property color urgencyCritical: accentRed
  readonly property color batteryGood: accentGreen
  readonly property color batteryWarning: accentOrange
  readonly property color batteryCritical: accentRed
}
