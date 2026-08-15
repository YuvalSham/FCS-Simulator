import QtQuick
import myGUI

Item {
    id: button_row

    width: row_container.width
    height: row_container.height

    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottomMargin: SystemConfig.bRowBottomMargin

    signal togglePanelsClicked()
    signal settingsClicked()

    Row {
        id: row_container
        spacing: SystemConfig.bRowSpacing

        Item {
            width: main_screen ? main_screen.width / SystemConfig.bRowItemWidthRatio : SystemConfig.bRowItemDefaultWidth
            height: width * SystemConfig.bRowItemHeightMultiplier

            Rectangle {
                anchors.fill: parent
                radius: width / 2
                color: SystemConfig.bRowOuterColor
                border.color: SystemConfig.bRowOuterBorderColor
                border.width: SystemConfig.bRowOuterBorderWidth
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width * SystemConfig.bRowMiddleTopMarginRatio
                width: parent.width * SystemConfig.bRowMiddleSizeRatio
                height: width
                radius: width / 2
                color: SystemConfig.bRowMiddleColor
            }

            Rectangle {
                id: eye_btn
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width * SystemConfig.bRowInnerTopMarginRatio
                width: parent.width * SystemConfig.bRowInnerSizeRatio
                height: width
                radius: width / 2

                color: SystemConfig.defaultButtonColor
                border.color: SystemConfig.borderButtonColor
                border.width: SystemConfig.buttonBorderWidth

                Text {
                    text: "👁️"
                    font.pixelSize: parent.height * SystemConfig.bRowIconSizeRatio
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onPressed: eye_btn.color = SystemConfig.onHoverButtonColor
                    onReleased: eye_btn.color = SystemConfig.defaultButtonColor
                    onClicked: button_row.togglePanelsClicked()
                }
            }
        }

        Item {
            width: main_screen ? main_screen.width / SystemConfig.bRowItemWidthRatio : SystemConfig.bRowItemDefaultWidth
            height: width * SystemConfig.bRowItemHeightMultiplier

            Rectangle {
                anchors.fill: parent
                radius: width / 2
                color: SystemConfig.bRowOuterColor
                border.color: SystemConfig.bRowOuterBorderColor
                border.width: SystemConfig.bRowOuterBorderWidth
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width * SystemConfig.bRowMiddleTopMarginRatio
                width: parent.width * SystemConfig.bRowMiddleSizeRatio
                height: width
                radius: width / 2
                color: SystemConfig.bRowMiddleColor
            }

            Rectangle {
                id: settings_btn
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width * SystemConfig.bRowInnerTopMarginRatio
                width: parent.width * SystemConfig.bRowInnerSizeRatio
                height: width
                radius: width / 2

                color: SystemConfig.defaultButtonColor
                border.color: SystemConfig.borderButtonColor
                border.width: SystemConfig.buttonBorderWidth

                Text {
                    text: "⚙️"
                    font.pixelSize: parent.height * SystemConfig.bRowIconSizeRatio
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onPressed: settings_btn.color = SystemConfig.onHoverButtonColor
                    onReleased: settings_btn.color = SystemConfig.defaultButtonColor
                    onClicked: button_row.settingsClicked()
                }
            }
        }
    }
}
