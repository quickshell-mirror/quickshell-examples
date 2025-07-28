import QtQuick
import QtQuick.Layouts

import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  property int padding: 16

  Layout.fillHeight: true
  color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)
  implicitWidth: timeContainer.width + padding
  radius: 5

  Gen.WaybarItem {
    id: timeContainer

    icon {
      id: icon

      color: Dat.Colors.on_background
      text: "schedule"
    }

    text {
      id: text

      color: Dat.Colors.on_background
      font.pointSize: 11
      text: Qt.formatDateTime(Dat.Time?.date, "h:mm:ss AP")
    }
  }
}
