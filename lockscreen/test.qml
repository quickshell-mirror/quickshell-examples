import QtQuick
import Quickshell

ShellRoot {
	AuthContext {
		id: authContext
		onUnlocked: Qt.quit()
	}

	FloatingWindow {
		color: "#303030"

		Lockscreen {
			anchors.fill: parent
			context: authContext
		}
	}
}
