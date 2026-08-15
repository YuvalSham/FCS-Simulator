pragma Singleton
import QtQuick

QtObject {
    property color defaultButtonColor: "#001155"
    property color onHoverButtonColor: "#555577"
    property color borderButtonColor: "#dadafa"
    property color textButtonColor: "#bbfa88"

    property int buttonBorderWidth: 2
    property real buttonWidthRatio: 10
    property real buttonHeightRatio: 12
    property real textSizeRatio: 0.3

    // BRow configurations
    property int bRowBottomMargin: -50
    property int bRowSpacing: 20

    property real bRowItemWidthRatio: 16
    property real bRowItemDefaultWidth: 90
    property real bRowItemHeightMultiplier: 1.5

    property color bRowOuterColor: "#40bbfa88"
    property color bRowOuterBorderColor: "#80bbfa88"
    property real bRowOuterBorderWidth: 1.5

    property color bRowMiddleColor: "#60bbfa88"
    property real bRowMiddleTopMarginRatio: 0.08
    property real bRowMiddleSizeRatio: 0.84

    property real bRowInnerTopMarginRatio: 0.14
    property real bRowInnerSizeRatio: 0.72
    property real bRowIconSizeRatio: 0.45

    // Reticle configurations
    property real reticleWidth: 100
    property real reticleHeight: 100
    property real reticleLineWidth: 2
    property color reticleColor: "red"
    property real reticleCircleSize: 40
    property real reticleCircleBorderWidth: 2
}
