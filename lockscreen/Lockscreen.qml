import QtQuick
import QtQuick.Controls.Basic

Item {
	required property AuthContext context

	Item {
		anchors.centerIn: parent
		scale: 2

		TextField {
			id: entryBox
			anchors.centerIn: parent
			width: 300

			enabled: context.status != AuthContext.Status.Authenticating
			focus: true
			horizontalAlignment: TextInput.AlignHCenter
			echoMode: TextInput.Password
			inputMethodHints: Qt.ImhSensitiveData
			placeholderText: "Enter password"

			onAccepted: {
				if (text != "") context.tryLogin(text)
			}

			onEnabledChanged: {
				if (enabled) text = ""
			}
		}

		Text {
			id: status
			color: "white"

			anchors {
				horizontalCenter: entryBox.horizontalCenter
				top: entryBox.bottom
				topMargin: 20
			}

			text: {
				switch (context.status) {
				case AuthContext.Status.FirstLogin: return ""
				case AuthContext.Status.Authenticating: return "Authenticating"
				case AuthContext.Status.LoginFailed: return "Login Failed"
				}
			}
		}
	}
}
