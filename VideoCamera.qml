import QtQuick
import QtMultimedia

Item {
    id: cameraRoot
    anchors.fill: parent
    clip: true

    property var fovModes: [
        { name: "FOV: Narrow", factor: 1.0 },
        { name: "FOV: Wide", factor: 2.0 },
        { name: "FOV: Very Wide",   factor: 5 }
    ]
    property int currentFovIndex: 0
    property string currentFovName: fovModes[0].name

    function toggleCamera() {
        if (camera.active) {
            camera.stop()
        } else {
            camera.start()
        }
    }

    function cycleFov() {
        currentFovIndex = (currentFovIndex + 1) % fovModes.length
        currentFovName = fovModes[currentFovIndex].name
        videoOutput.scale = fovModes[currentFovIndex].factor
    }

    MediaDevices {
        id: mediaDevices
    }

    Camera {
        id: camera
        cameraDevice: mediaDevices.defaultVideoInput
        active: true
    }

    CaptureSession {
        camera: camera
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        visible: camera.active

        Behavior on scale {
            NumberAnimation { duration: 200 }
        }
    }
}
