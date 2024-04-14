import Quickshell // for ShellRoot and PanelWindow
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell.Wayland // for WlrLayershell

ShellRoot {
    PanelWindow {
        WlrLayershell.layer: WlrLayer.Background

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
            AnimatedImage {
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

    Variants {
        // Create the panel once on each monitor.
        model: Quickshell.screens

        PanelWindow {
            id: w

            property var modelData
            screen: modelData

            anchors {
                right: true
                bottom: true
            }

            margins {
                right: 50
                bottom: 50
            }

            width: content.width
            height: content.height

            color: "transparent"

            // Give the window an empty click mask so all clicks pass through it.
            mask: Region {}

            // Use the wlroots specific layer property to ensure it displays over
            // fullscreen windows.
            WlrLayershell.layer: WlrLayer.Overlay

            ColumnLayout {
                id: content

                Text {
                    text: "Activate NixOS"
                    color: "#50ffffff"
                    font.pointSize: 22
                }

                Text {
                    text: "Go to Settings to activate NixOS"
                    color: "#50ffffff"
                    font.pointSize: 14
                }
            }
        }
    }
}
