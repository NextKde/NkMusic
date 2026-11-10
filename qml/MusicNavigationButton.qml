import QtQuick
import Kos.Ui
LiquidNavigationButton {
    specificationForm: true
    implicitHeight: MusicColors.sidebarRowHeight
    cornerRadius: 8
    showIdleBackground: false
    iconColor: MusicColors.sidebarAccent
    selectionColor: MusicColors.selectedTint
    hoverColor: MusicColors.hoverFill
    focusRingColor: MusicColors.sidebarAccent
    keyboardFocusOnly: true
}
