import QtQuick
import QtQuick.Controls
import QtTest
import Kos.Ui
import NextKde.Music

TestCase {
    id: test
    name: "DemoContractIntegration"
    width: 640; height: 520
    visible: true
    when: windowShown
    Button { id: anchor; x: 280; y: 80; width: 60; height: 30; text: "Open" }
    MusicContentPopover {
        id: editor
        anchorItem: anchor
        preferredSide: "bottom"
        width: 300
        title: "Edit playlist"
        standardButtons: Dialog.Ok | Dialog.Cancel
        contentItem: MusicTextField { text: "Playlist" }
    }
    SignalSpy { id: accepted; target: editor; signalName: "accepted" }
    MusicSelect {
        id: select
        x: 280; y: 200
        model: ["System", "Light", "Dark"]
        onActivated: index => currentIndex = index
    }
    function cleanup() { editor.close(); select.closeMenu(); accepted.clear() }
    function test_popover_buttons_and_accept() {
        editor.open()
        tryCompare(editor, "opened", true)
        verify(editor.y >= anchor.y + anchor.height)
        verify(!editor.modal)
        const ok = editor.standardButton(Dialog.Ok)
        compare(ok.height, 30)
        compare(ok.cornerRadius, 15)
        verify(ok.primaryAction)
        ok.enabled = false
        compare(ok.surfaceColor, AppTheme.controlBackground)
        ok.enabled = true
        compare(ok.surfaceColor, AppTheme.defaultAccentSeed)
        mouseClick(ok, ok.width/2, ok.height/2)
        compare(accepted.count, 1)
        tryCompare(editor, "visible", false)
    }
    function test_select_keyboard_commits_host_state() {
        select.currentIndex = 0
        select.forceActiveFocus()
        keyClick(Qt.Key_Space)
        tryCompare(select, "popupOpened", true)
        keyClick(Qt.Key_Down)
        keyClick(Qt.Key_Return)
        tryCompare(select, "currentIndex", 1)
        tryCompare(select, "popupOpened", false)
        compare(select.height, 24)
        verify(select.plainTrigger && select.neutralOptionHighlight)
        compare(select.popupBorderWidth, 0)
    }
}
