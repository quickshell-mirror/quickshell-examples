import QtQuick
import QtQuick.Layouts

import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  property int padding: 16

  Layout.fillHeight: true
  color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)
  implicitWidth: container.width + padding
  radius: 5

  Gen.WaybarItem {
    id: container

    icon {
      color: Dat.Colors.tertiary
      font.family: Dat.Fonts.caskaydia
      text: "󱄅"
    }

    text {
      color: Dat.Colors.tertiary
      text: "NixOS"
    }
  }
}
