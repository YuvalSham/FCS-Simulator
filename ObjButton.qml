import QtQuick

Rectangle{
    id: button_root

    property string button_name: "Default"

    property color defaultButtonColor: "#001155"
    property color onHoverButtonColor: "#555577"
    property color borderButtonColor: "#dadafa"
    property color textButtonColor: "#bbfa88"

    property double buttonWidth: main.width/9
    property double buttonHeight: main.height/13
    property double buttonTextSize: button_root.height * 0.3
    property int buttonBorderWidth: 2

    signal clicked()

    width: buttonWidth
    height: buttonHeight

    color: defaultButtonColor
    border{color:borderButtonColor ;width: buttonBorderWidth}

    Text {
        text: button_root.button_name
        font.bold: true
        color: textButtonColor
        font.pixelSize: buttonTextSize
        anchors.centerIn: parent
    }
    MouseArea{ anchors.fill: parent ; acceptedButtons: Qt.LeftButton

        onPressed: {
            button_root.color = onHoverButtonColor
        }
        onReleased: {
            button_root.color = defaultButtonColor
        }
        onClicked: {
            console.log(button_root.button_name + " pressed!")
            button_root.clicked()
        }


    }


}
