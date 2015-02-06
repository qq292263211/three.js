import QtQuick 2.0
import QtCanvas3D 1.0
import QtQuick.Controls 1.2

import "animation-cloth.js" as GLCode

Item {
    id: mainview
    width: 1280
    height: 768
    visible: true

    Button {
        id: cameraButton
        anchors.left: parent.left
        width: parent.width / 4
        text: "Toggle Camera"

        onClicked: GLCode.toggleCamera()
    }
    Button {
        id: windButton
        anchors.left: cameraButton.right
        width: parent.width / 4
        text: "Toggle Wind"

        onClicked: GLCode.toggleWind()
    }

    Button {
        id: ballButton
        anchors.left: windButton.right
        width: parent.width / 4
        text: "Toggle Ball"

        onClicked: GLCode.toggleBall()
    }

    Button {
        id: pinsButton
        anchors.left: ballButton.right
        anchors.right: parent.right
        width: parent.width / 4
        text: "Toggle Pins"

        onClicked: GLCode.togglePins()
    }

    Canvas3D {
        id: canvas3d
        width: parent.width
        anchors.top: cameraButton.bottom
        anchors.bottom: parent.bottom
        focus: true
        logAllCalls: false
        logAllErrors: false

        // Emitted when one time initializations should happen
        onInitGL: {
            GLCode.initGL(canvas3d);
        }

        // Emitted each time Canvas3D is ready for a new frame
        onRenderGL: {
            GLCode.renderGL(canvas3d);
        }

        onWidthChanged: {
            GLCode.onCanvasResize(canvas3d);
        }

        onHeightChanged: {
            GLCode.onCanvasResize(canvas3d);
        }

        onDevicePixelRatioChanged: {
            GLCode.onCanvasResize(canvas3d);
        }

    }
}