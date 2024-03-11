import QtQuick
import QtQuick.Controls.Basic
import Quickshell
import Quickshell.Wayland

ShellRoot {
	AuthContext {
		id: authContext
		onUnlocked: lock.locked = false
	}

	WlSessionLock {
		id: lock
		locked: true

		onLockedChanged: {
			if (!locked) Qt.quit();
		}

		WlSessionLockSurface {
			// You probably want to replace this with an image.
			color: "#303030"

			// For your own sanity you should probably keep this
			// while working on the lockscreen.
			Button {
				text: "Help! I misconfigured my lockscreen!"
				onClicked: lock.locked = false
			}

			Lockscreen {
				anchors.fill: parent
				context: authContext
			}
		}
	}

}
