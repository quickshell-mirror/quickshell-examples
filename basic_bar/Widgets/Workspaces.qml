pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  Layout.fillHeight: true
  clip: true
  color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)
  implicitWidth: container.width
  radius: 5

  Behavior on implicitWidth {
    NumberAnimation {
      duration: 200
      easing.type: Easing.InOutQuad
    }
  }

  MouseArea {
    id: mArea

    anchors.fill: parent
    hoverEnabled: true

    RowLayout {
      id: container

      property int focusedWorkspace: Hyprland.focusedWorkspace?.id ?? "0"

      anchors.bottom: parent.bottom
      anchors.left: parent.left
      anchors.top: parent.top
      clip: true
      spacing: 0

      Repeater {
        model: 6

        delegate: Item {
          id: delegateRoot

          required property int index

          Layout.fillHeight: true
          implicitWidth: this.height ? this.height : 1

          Rectangle {
            id: bgCon

            anchors.fill: parent
            anchors.margins: 4
            color: Dat.Colors.primary
            radius: 5
            visible: container.focusedWorkspace == index + 1
          }

          Gen.MouseArea {
            anchors.margins: 4
            layerColor: fgText.color
            layerRadius: 5
            visible: !bgCon.visible

            onClicked: Hyprland.dispatch("workspace " + (parent.index + 1))
          }

          Text {
            id: fgText

            anchors.centerIn: parent
            color: bgCon.visible ? Dat.Colors.on_primary : Dat.Colors.on_background
            font.pointSize: 11
            text: delegateRoot.index + 1
          }
        }
      }
    }
  }
}
