import QtQuick
import myGUI

Item {
    id: reticleRoot
    anchors.centerIn: parent
    width: 600
    height: 400
    visible: true

    Canvas {
        id: reticleCanvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            ctx.strokeStyle = SystemConfig.reticleColor;
            ctx.lineWidth = SystemConfig.reticleLineWidth;
            ctx.lineCap = "square";

            var cx = width / 2;
            var cy = height / 2;

            ctx.beginPath();

            // סימון U מרכזי
            var uW = 12;
            var uH = 10;
            ctx.moveTo(cx - uW / 2, cy - uH / 2);
            ctx.lineTo(cx - uW / 2, cy + uH / 2);
            ctx.lineTo(cx + uW / 2, cy + uH / 2);
            ctx.lineTo(cx + uW / 2, cy - uH / 2);

            // ציר אנכי מקוטע
            ctx.moveTo(cx, cy - 20); ctx.lineTo(cx, cy - 55);
            ctx.moveTo(cx, cy - 75); ctx.lineTo(cx, cy - 140);
            ctx.moveTo(cx, cy + 20); ctx.lineTo(cx, cy + 55);
            ctx.moveTo(cx, cy + 75); ctx.lineTo(cx, cy + 140);

            // ציר אופקי מקוטע
            ctx.moveTo(cx - 10, cy); ctx.lineTo(cx - 24, cy);
            ctx.moveTo(cx - 40, cy); ctx.lineTo(cx - 75, cy);
            ctx.moveTo(cx - 110, cy); ctx.lineTo(cx - 116, cy);
            ctx.moveTo(cx - 135, cy); ctx.lineTo(cx - 240, cy);

            ctx.moveTo(cx + 10, cy); ctx.lineTo(cx + 24, cy);
            ctx.moveTo(cx + 40, cy); ctx.lineTo(cx + 75, cy);
            ctx.moveTo(cx + 110, cy); ctx.lineTo(cx + 116, cy);
            ctx.moveTo(cx + 135, cy); ctx.lineTo(cx + 240, cy);

            // קווי טווח מקבילים (Stadia Lines)
            var stadiaOffset = 40;
            var stadiaW = 75;
            ctx.moveTo(cx - 110, cy - stadiaOffset); ctx.lineTo(cx - 110 + stadiaW, cy - stadiaOffset);
            ctx.moveTo(cx + 110 - stadiaW, cy - stadiaOffset); ctx.lineTo(cx + 110, cy - stadiaOffset);
            ctx.moveTo(cx - 110, cy + stadiaOffset); ctx.lineTo(cx - 110 + stadiaW, cy + stadiaOffset);
            ctx.moveTo(cx + 110 - stadiaW, cy + stadiaOffset); ctx.lineTo(cx + 110, cy + stadiaOffset);

            ctx.stroke();
        }
    }
}
