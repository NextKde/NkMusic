import QtQuick
import Kos.Ui

// Demo SettingsExample geometry: a 44x20 body in a 24px settings slot.
Item {
    id: slot
    implicitWidth: 44
    implicitHeight: 24
    property bool checked: false
    property string accessibleName: parent && parent.parent && parent.parent.isSettingsItem === true ? parent.parent.title : ""
    signal toggled(bool checked)
    LiquidGlassSwitch {
        anchors.centerIn: parent
        width: 44; height: 20
        materialForm: true
        enabled: slot.enabled
        checked: slot.checked
        Accessible.name: slot.accessibleName
        onToggled: checked => slot.toggled(checked)
    }
}
