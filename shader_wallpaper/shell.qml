import Quickshell
import QtQuick
import Quickshell.Wayland // for WlrLayershell & WlrLayer

ShellRoot {
    PanelWindow {
        WlrLayershell.layer: WlrLayer.Background // use this to make it background

        anchors {
            top: true
            left: true
            right: true
            bottom: true
        }

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            Image { // if you want a gif, use AnimatedImage instead
                id: img
                source: "./hollow.jpg"
                fillMode: Image.PreserveAspectCrop
                anchors.fill: parent
                visible: false
                mipmap: true
            }
            ShaderEffect {
                id: shader
                anchors.fill: parent
                property vector2d resolution: Qt.vector2d(width, height)
                property real time: 0
                property variant source: img
                FrameAnimation {
                    running: true
                    onTriggered: {
                        shader.time = this.elapsedTime;
                    }
                }
                vertexShader: "default.vert.qsb"
                fragmentShader: "Raining.frag.qsb"
            }
        }
    }
}
