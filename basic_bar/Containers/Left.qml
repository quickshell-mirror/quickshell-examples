import QtQuick
import QtQuick.Layouts
import "../Widgets/" as Wid

Item {
  RowLayout {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.top: parent.top

    Wid.OsText {
    }

    Wid.Workspaces {
    }

    Wid.WorkspaceName {
    }
  }
}
