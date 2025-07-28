// a thin wrapper for Material Symbols
import QtQuick
import "../Data/" as Dat

Text {
  id: root

  property real fill: 0
  property int grad: 0
  required property string icon

  font.family: "Material Symbols Rounded"
  font.hintingPreference: Font.PreferFullHinting

  // refer https://developers.google.com/fonts/docs/material_symbols
  font.variableAxes: {
    "FILL": root.fill,
    "opsz": root.fontInfo.pixelSize,
    // "GRAD": root.grad,
    "wght": root.fontInfo.weight
  }
  renderType: Text.NativeRendering
  text: root.icon

  Behavior on fill {
    NumberAnimation {
      duration: 180
      easing.type: Easing.InOutQuad
    }
  }
}
