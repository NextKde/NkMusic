import QtQuick
import Kos.Ui
LiquidActionButton {
    id: control
    property string hint: iconOnly ? Accessible.name : ""
    KosToolTip { target: control; text: control.hint }
    materialForm: true
    shadowEnabled: false
    shadowOpacity: .06
    iconColor: destructive ? AppTheme.destructive : MusicColors.icon
    // Solid actions must remain visible against the white content canvas.
    surfaceColor: materialForm ? (AppTheme.dark ? "#323236" : "#e9e9ec") : MusicColors.controlSurface
    accentColor: materialForm ? MusicColors.selectedSurface : MusicColors.selectedTint
    keyboardFocusOnly: true
}
