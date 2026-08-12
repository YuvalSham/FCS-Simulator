import QtQuick

Rectangle{
    id: button_root
    property string button_name: "Default"

    width: main.width/9
    height: main.height/13

    color: "blue"
    border{
        color: "white"
        width: 2
    }
    Text {
            id: text

            text: button_root.button_name
            font.bold: true
            color: "white"
            font.pixelSize: button_root.height * 0.3

            anchors.centerIn: parent
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log(button_root.button_name + " has been clicked !")
        }
    }


}
