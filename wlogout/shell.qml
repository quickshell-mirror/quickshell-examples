import QtQuick
import Quickshell

ShellRoot {
	WLogout {
		WlButton {
			command: "loginctl lock-screen"
			keybind: Qt.Key_K
			text: "Lock"
			icon: "lock"
		}

		WlButton {
			command: "loginctl terminate-user $USER"
			keybind: Qt.Key_E
			text: "Logout"
			icon: "logout"
		}

		WlButton {
			command: "systemctl suspend"
			keybind: Qt.Key_U
			text: "Suspend"
			icon: "suspend"
		}

		WlButton {
			command: "systemctl hibernate"
			keybind: Qt.Key_H
			text: "Hibernate"
			icon: "hibernate"
		}

		WlButton {
			command: "systemctl poweroff"
			keybind: Qt.Key_K
			text: "Shutdown"
			icon: "shutdown"
		}

		WlButton {
			command: "systemctl reboot"
			keybind: Qt.Key_R
			text: "Reboot"
			icon: "reboot"
		}
	}
}
