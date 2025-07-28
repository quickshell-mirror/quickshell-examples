import QtQuick
import QtQuick.Layouts
import "../Widgets/" as Wid

Item {
  RowLayout {
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top

    Wid.Clock {
    }
  }
}
