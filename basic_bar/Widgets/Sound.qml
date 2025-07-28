import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  id: root

  property string icon: Dat.Audio.getIcon(root.node)
  property PwNode node: Pipewire.defaultAudioSink
  property int padding: 20

  Layout.fillHeight: true
  color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)
  implicitWidth: container.width + padding
  radius: 5

  Behavior on implicitWidth {
    NumberAnimation {
      duration: 200
      easing.type: Easing.InOutQuad
    }
  }

  PwObjectTracker {
    objects: [root.node]
  }

  Gen.WaybarItem {
    id: container

    spacing: 10

    icon {
      color: Dat.Colors.on_background
      text: root.icon
    }

    text {
      color: Dat.Colors.on_background
      text: (node.audio.volume * 100).toFixed(0) + "%"
    }
  }

  MouseArea {
    acceptedButtons: Qt.MiddleButton
    anchors.fill: parent

    onClicked: mevent => Dat.Audio.toggleMute(root.node)
    onWheel: mevent => Dat.Audio.wheelAction(mevent, root.node)
  }
}
