import QtQuick

Item {
    id: vertical_column

    property double columnWidth: main.width / 2
    property double columnHeight: main.height
    property bool isRightSide: false

    property alias button1: columnButtons_1
    property alias button2: columnButtons_2
    property alias button3: columnButtons_3
    property alias button4: columnButtons_4

    width: columnWidth
    height: columnHeight

    Column {
        id: column_container

        width: parent.width

        topPadding: main.height / 5
        spacing: main.height / 10

        ObjButton {
            id: columnButtons_1
            x: isRightSide ? main.width-buttonWidth+buttonBorderWidth : -border.width
        }
        ObjButton {
            id: columnButtons_2
            x: isRightSide ? main.width-buttonWidth+buttonBorderWidth : -border.width
        }
        ObjButton {
            id: columnButtons_3
            x: isRightSide ? main.width-buttonWidth+buttonBorderWidth : -border.width
        }
        ObjButton {
            id: columnButtons_4
            x: isRightSide ? main.width-buttonWidth+buttonBorderWidth : -border.width
        }
    }
}
