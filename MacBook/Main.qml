import QtQuick

Window {
    id: main
    visible: true
    title: qsTr("---- MFDU Ver. 2.0.0.0.1 ----")

    visibility: Window.FullScreen



    MainScreen{
        anchors.fill: parent
    }
}