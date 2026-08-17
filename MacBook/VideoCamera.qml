import QtQuick
import QtMultimedia

Item {
    id: camera_root

    anchors.fill: parent
    clip: true

    property alias currentFovName: fov_text.text
    property int cameraState: 0
    property string currentCameraName: "Off"

    Component.onCompleted: {
        console.log("--- Available Cameras ---")
        const devices = mediaDevices.videoInputs
        for (let i = 0; i < devices.length; ++i) {
            console.log("Camera " + i + ": " + devices[i].description)
        }
    }

    function getFirstCamera() {
        const devices = mediaDevices.videoInputs
        for (let i = 0; i < devices.length; ++i) {
            const desc = devices[i].description.toLowerCase()
            if (desc.includes("back") || desc.includes("rear")) {
                return devices[i]
            }
        }
        return null
    }

    function getIPhoneCamera() {
            const devices = mediaDevices.videoInputs
            for (let i = 0; i < devices.length; ++i) {
                const desc = devices[i].description.toLowerCase()
                if (desc.includes("iphone")) {
                    return devices[i]
                }
            }
            for (let i = 0; i < devices.length; ++i) {
                const desc = devices[i].description.toLowerCase()
                if (!desc.includes("built-in") && !desc.includes("facetime") && !desc.includes("front")) {
                    return devices[i]
                }
            }
            return null
        }

    function toggleCamera() {
        cameraState = (cameraState + 1) % 3

        if (cameraState === 0) {
            currentCameraName = "Off"
            camera.stop()
        } else if (cameraState === 1) {
            const firstCam = getFirstCamera()
            if (firstCam) {
                camera.cameraDevice = firstCam
                currentCameraName = firstCam.description
                camera.start()
            } else {
                cameraState = 2
                applyIPhoneState()
            }
        } else if (cameraState === 2) {
            applyIPhoneState()
        }
    }

    function applyIPhoneState() {
        const iPhoneCam = getIPhoneCamera()
        if (iPhoneCam) {
            camera.cameraDevice = iPhoneCam
            currentCameraName = iPhoneCam.description
            camera.start()
        } else {
            cameraState = 0
            currentCameraName = "Off"
            camera.stop()
        }
    }

    function cycleFov() {
        if (camera_root.currentFovName === "Narrow") {
            camera_root.currentFovName = "Wide"
            videoOutput.scale = 1.0
        } else {
            camera_root.currentFovName = "Narrow"
            videoOutput.scale = 7.0
        }
    }

    MediaDevices {
        id: mediaDevices
    }

    CaptureSession {
        id: captureSession
        camera: Camera {
            id: camera
            active: false
        }
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        visible: camera.active
        scale: 1.0
        orientation: cameraState === 1 ? 180 : 0

        Behavior on scale {
            NumberAnimation { duration: 250; easing.type: Easing.InOutQuad }
        }
    }

    Text {
        id: fov_text
        visible: false
        text: "Wide"
    }
}