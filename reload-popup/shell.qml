import QtQuick
import Quickshell

ShellRoot {
	// Add the popup to the shell.
	ReloadPopup {}

	// The rest of your shell, in this case a very simple bar.
	// Try editing this.
	PanelWindow {
		anchors {
			left: true
			top: true
			right: true
		}

		height: 30

		Text {
			anchors.centerIn: parent
			text: "I'm a bar!"
		}
	}
}
