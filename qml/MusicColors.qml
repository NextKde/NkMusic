pragma Singleton
import QtQuick
import Kos.Ui
QtObject {
    readonly property int sidebarPadding: 16
    readonly property int sidebarRowHeight: 30
    readonly property int sidebarRowGap: 4
    readonly property int sidebarGroupGap: 16
    readonly property int sidebarTitleSize: 17
    readonly property int sidebarCaptionSize: 11
    readonly property int sidebarSearchSize: 13
    readonly property int sidebarSearchHeight: 34
    readonly property int sidebarSearchIconSize: 14
    readonly property int sidebarControlInset: 12
    readonly property int sidebarIconGap: 6
    readonly property color sidebarLabelPrimary: AppTheme.dark ? Qt.rgba(1, 1, 1, .92) : Qt.rgba(0, 0, 0, .92)
    readonly property color sidebarLabelSecondary: AppTheme.dark ? Qt.rgba(1, 1, 1, .62) : Qt.rgba(0, 0, 0, .62)
    readonly property color sidebarLabelTertiary: AppTheme.dark ? Qt.rgba(1, 1, 1, .40) : Qt.rgba(0, 0, 0, .40)
    readonly property color text: AppTheme.text
    readonly property color icon: AppTheme.dark ? "#cdd1d7" : "#555b63"
    readonly property color controlSurface: AppTheme.dark ? "#20252f" : "#ffffff"
    readonly property color selectedSurface: AppTheme.dark ? "#48484a" : "#dcdce2"
    readonly property color previewBadgeSurface: AppTheme.dark ? "#c6cad0" : "#65666c"
    readonly property color previewBadgeText: AppTheme.dark ? "#202326" : "#ffffff"
    readonly property color selectedTint: AppTheme.dark ? "#a0a5ac" : "#707780"
    readonly property color hoverFill: AppTheme.withAlpha(text, .07)
    readonly property color sliderFill: AppTheme.dark ? "#bfc5cd" : "#747b84"
    readonly property color rowFill: AppTheme.dark ? "#292d33" : "#eff0f2"
    readonly property color placeholder: AppTheme.dark ? "#353a41" : "#dce0e5"
    // System accent is reserved for actual focus and meaningful on/active states.
    readonly property color focus: AppTheme.focusRing
    readonly property color sidebarAccent: AppTheme.dark ? "#ff453a" : "#fa233b"
}
