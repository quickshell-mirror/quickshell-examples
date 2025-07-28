import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import "../Data/" as Dat

Rectangle {
  id: root

  property int maximumWidth: 184
  property int padding: 16

  Layout.fillHeight: true
  Layout.maximumWidth: maximumWidth + padding
  clip: true
  color: Dat.Colors.withAlpha(Dat.Colors.background, 0.79)
  implicitWidth: windowNameText.contentWidth + padding
  radius: 5

  Behavior on implicitWidth {
    NumberAnimation {
      duration: 100
      easing.type: Easing.InOutQuad
    }
  }

  Text {
    id: windowNameText

    property string actWinName: activeWindow?.activated ? activeWindow?.appId : "desktop"
    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

    anchors.centerIn: parent
    color: Dat.Colors.on_primary_container
    elide: Text.ElideMiddle
    font.pointSize: 11
    horizontalAlignment: Text.AlignHCenter
    text: actWinName
    width: (contentWidth > root.maximumWidth) ? root.maximumWidth : undefined
  }
}
