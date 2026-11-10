import QtQuick
import QtQuick.Window
import QtTest
import MusicWindowTests

TestCase {
    name: "CooperativeControls"
    when: windowShown
    visible: true
    width: 400; height: 200
    Component { id: mock; Item {
        property Item target
        property var buttons: []
        property bool active: false
    } }
    MusicWindowControls {
        id: controls
        targetWindow: controls.Window.window
        maximizeMode: true
        platformComponent: mock
        circleSize: 14; buttonWidth: 14; buttonHeight: 14; spacing: 14
    }
    function test_takeover_and_fallback() {
        tryVerify(() => controls.platformReady)
        tryCompare(controls, "implicitWidth", 70)
        const client = findChild(controls, "clientWindowControls")
        compare(controls.buttonLayout.length, 3)
        compare(controls.buttonLayout[0].action, "maximize")
        compare(controls.buttonLayout[1].x, 28)
        compare(controls.buttonLayout[2].x, 56)
        controls.platformSlot.active = true
        compare(client.opacity, 0)
        compare(client.enabled, false)
        compare(controls.opacity, 1)
        compare(controls.platformSlot.target, controls)
        compare(controls.implicitWidth, 70)
        controls.platformSlot.active = false
        compare(client.opacity, 1)
        compare(client.enabled, true)
        controls.platformComponent = null
        compare(controls.platformReady, false)
        compare(client.opacity, 1)
    }
}
