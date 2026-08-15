import QtQuick
import myGUI // Imports the application module defined in CMakeLists.txt to access project-wide components and the SystemConfig singleton.

/*
 * Rectangle: The root visual container representing the button.
 * Defines the button's background, border styling, dynamic geometry,
 * and encapsulates all child elements (icon, text label, and input handling).
 */
Rectangle {
    id: button_root

    property string button_name: ""
    property string icon_source: ""

    signal clicked()

    width: parent ? parent.width : 100
    height: (main_screen ? main_screen.height : 1080) / SystemConfig.buttonHeightRatio

    color: SystemConfig.defaultButtonColor
    border {
        color: SystemConfig.borderButtonColor
        width: SystemConfig.buttonBorderWidth
    }

    Image {
        id: button_icon
        visible: button_root.icon_source !== ""
        source: button_root.icon_source
        anchors.centerIn: parent
        width: parent.height * 0.5
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
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

        onPressed: {
            button_root.color = SystemConfig.onHoverButtonColor
        }
        onReleased: {
            button_root.color = SystemConfig.defaultButtonColor
        }
        onClicked: {
            button_root.clicked()
        }
    }
}
