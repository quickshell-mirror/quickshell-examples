import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "../Containers/" as Con

Scope {
  Variants {
    model: Quickshell.screens

    delegate: WlrLayershell {
      id: layerShell

      required property ShellScreen modelData

      anchors.left: true
      anchors.right: true
      anchors.top: true
      color: "transparent"
      exclusionMode: ExclusionMode.Auto
      focusable: false
      implicitHeight: 40
      layer: WlrLayer.Top
      namespace: "rexies.quebar.top"
      screen: modelData
      surfaceFormat.opaque: false

      mask: Region {
        item: base
      }

      Item {
        id: base

        anchors.fill: parent
        anchors.margins: 4

        // radius: 5
        // color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)

        RowLayout {
          anchors.fill: parent

          Con.Left {
            Layout.fillHeight: true
            Layout.fillWidth: true
          }

          Con.Middle {
            Layout.fillHeight: true
            Layout.fillWidth: true
          }

          Con.Right {
            Layout.fillHeight: true
            Layout.fillWidth: true
          }
        }
      }
    }
  }
}
