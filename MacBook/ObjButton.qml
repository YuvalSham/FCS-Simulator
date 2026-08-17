import QtQuick
import myGUI

Item {
    id: button_root

    property string button_name: ""
    property string icon_source: ""
    property bool isRightSide: false

    signal clicked()

    width: parent ? parent.width : 100
    height: (main_screen ? main_screen.height : 1080) / SystemConfig.buttonHeightRatio
    clip: true

    Rectangle {
        id: bg_rect
        width: parent.width + radius
        height: parent.height
        radius: height / 2

        anchors.left: isRightSide ? parent.left : undefined
        anchors.right: isRightSide ? undefined : parent.right

        color: SystemConfig.defaultButtonColor
        border.color: SystemConfig.borderButtonColor
        border.width: SystemConfig.buttonBorderWidth
    }

    Text {
        visible: button_root.icon_source === ""
        text: button_root.button_name
        font.bold: true
        color: SystemConfig.textButtonColor
        font.pixelSize: button_root.height * SystemConfig.textSizeRatio
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onPressed: bg_rect.color = SystemConfig.onHoverButtonColor
        onReleased: bg_rect.color = SystemConfig.defaultButtonColor
        onClicked: button_root.clicked()
    }
}
