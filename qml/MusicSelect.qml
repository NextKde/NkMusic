import QtQuick
import Kos.Ui

LiquidSelect {
    Accessible.name: parent && parent.parent && parent.parent.isSettingsItem === true ? parent.parent.title : ""
    materialForm: true
    implicitHeight: 24
    appearanceMode: AppTheme.dark ? "dark" : "light"
    plainTrigger: true
    indicatorStyle: "upDown"
    indicatorBackground: true
    popupMaterialForm: true
    compactPopup: true
    popupBorderWidth: 0
    popupShadowEnabled: true
    popupFontWeight: Font.Normal
    neutralOptionHighlight: true
    sheetColor: AppTheme.dark ? "#303034" : "#f0f0f1"
}
