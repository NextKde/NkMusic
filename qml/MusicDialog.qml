import QtQuick
import QtQuick.Window
import Kos.Ui

// App supplies the scene; canonical Demo owns all dialog geometry and material.
LiquidDialog {
    readonly property var hostWindow: parent ? parent.Window.window : null
    sourceItem: hostWindow && hostWindow.musicPopupScene !== undefined ? hostWindow.musicPopupScene : null
}
