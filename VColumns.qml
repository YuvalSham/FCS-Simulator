import QtQuick
import myGUI

Item {
    id: vertical_column

    property double columnWidth: parent ? parent.width / SystemConfig.buttonWidthRatio : 150
    property bool isRightSide: false

    property alias button1: columnButtons_1
    property alias button2: columnButtons_2
    property alias button3: columnButtons_3
    property alias button4: columnButtons_4

    width: columnWidth
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    Behavior on x {
        NumberAnimation { duration: 350; easing.type: Easing.InOutExpo }
    }

    Column {
        id: column_container

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right

        spacing: parent.height * 0.03

        ObjButton {
            id: columnButtons_1
        }
        ObjButton {
            id: columnButtons_2
        }
        ObjButton {
            id: columnButtons_3
        }
        ObjButton {
            id: columnButtons_4
        }
    }
}
