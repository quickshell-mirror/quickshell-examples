import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import "../Data/" as Dat

RowLayout {
  id: root

  property alias icon: icon
  property alias text: text

  anchors.centerIn: parent
  height: parent.height ? parent.height : 1

  Item {
    id: iconContainer

    Layout.fillHeight: true
    implicitWidth: icon.width

    Text {
      id: icon

      anchors.centerIn: parent
      font.family: "Material Symbols Rounded"
      font.pointSize: 16
    }
  }

  Item {
    id: textContainer

    Layout.fillHeight: true
    implicitWidth: text.width

    Text {
      id: text

      anchors.centerIn: parent
      font.family: Dat.Fonts.dejavuSans
      font.pointSize: 11
    }
  }
}
