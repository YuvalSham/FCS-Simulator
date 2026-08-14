import QtQuick

Item {
    id: main_screen

    anchors.fill: parent

    Background {}

    VideoCamera {id: videoCamera}
    Reticle{ id: reticle}

    BRow{

    }

    VColumns{
        id: left_column

        isRightSide: false

        button1.button_name: "Index"
        button2.button_name: "Mode"
        button3.button_name: "Maps"
        button4.button_name: "Set Range"

        button1.onClicked: console.log("Index clicked")
        button2.onClicked: console.log("Mode clicked")
        button3.onClicked: console.log("Maps clicked")
        button4.onClicked: console.log("Set Range clicked")
    }

    VColumns{
        id: right_column

        isRightSide: true

        button1.button_name: "Camera"
        button2.button_name: videoCamera.currentFovName
        button3.button_name: "Functions"
        button4.button_name: "Reticle"

        button1.onClicked: videoCamera.toggleCamera()
        button2.onClicked: {
            videoCamera.cycleFov()
        }
        button3.onClicked: console.log("Functions clicked")
        button4.onClicked: reticle.visible = !reticle.visible
    }


}
