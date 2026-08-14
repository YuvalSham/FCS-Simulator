import QtQuick

Item {
    id: reticleRoot
    anchors.centerIn: parent
    width: 100
    height: 100
    visible: true

    // קו אופקי
    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: 2
        color: "red"
    }

    // קו אנכי
    Rectangle {
        anchors.centerIn: parent
        width: 2
        height: parent.height
        color: "red"
    }

    // מעגל מרכזי
    Rectangle {
        anchors.centerIn: parent
        width: 40
        height: 40
        radius: width / 2
        color: "transparent"
        border.color: "red"
        border.width: 2
    }
}
