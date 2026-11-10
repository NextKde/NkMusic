import QtQuick
import QtQuick.Controls
import QtQuick.Window
import Kos.Ui

// Contextual content retains canonical arrows/material and solid dialog actions.
LiquidContentPopover {
    id: panel
    readonly property var hostWindow: parent ? parent.Window.window : null
    sourceItem: hostWindow && hostWindow.musicPopupScene !== undefined ? hostWindow.musicPopupScene : null
    header: Label {
        visible: panel.title.length > 0
        text: panel.title
        padding: 14
        color: AppTheme.text
        font.pixelSize: 15
        font.weight: Font.Bold
        elide: Text.ElideRight
    }
    footer: DialogButtonBox {
        visible: panel.standardButtons !== Dialog.NoButton
        standardButtons: panel.standardButtons
        padding: 14
        spacing: 8
        delegate: LiquidDialogButton {
            primaryAction: DialogButtonBox.buttonRole === DialogButtonBox.AcceptRole
                || DialogButtonBox.buttonRole === DialogButtonBox.ApplyRole
        }
        background: Item {}
    }
}
