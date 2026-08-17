pragma Singleton
import QtQuick

QtObject {
    property color defaultButtonColor: "#66001155"
    property color onHoverButtonColor: "#66555577"
    property color borderButtonColor: "#ffdadafa"
    property color textButtonColor: "#ffbbfa88"

    property int buttonBorderWidth: 2
    property real buttonWidthRatio: 10
    property real buttonHeightRatio: 12
    property real textSizeRatio: 0.3
    property real columnSpacingRatio: 0.09

    // BRow configurations
    property int bRowBottomMargin: -50
    property int bRowSpacing: 20

    property real bRowItemWidthRatio: 16
    property real bRowItemDefaultWidth: 90
    property real bRowItemHeightMultiplier: 1.5

    property color bRowOuterColor: "#4000bb22"
    property color bRowOuterBorderColor: "#80dadafa"
    property real bRowOuterBorderWidth: 1.5

    property color bRowMiddleColor: "#60001155"
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
