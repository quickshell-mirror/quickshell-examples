import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

ShellRoot {
	FloatingWindow {
		// match the system theme background color
		color: contentItem.palette.active.window

		ScrollView {
			anchors.fill: parent
			contentWidth: availableWidth

			ColumnLayout {
				anchors.fill: parent
				anchors.margins: 10

				// get a list of nodes that output to the default sink
				PwNodeLinkTracker {
					id: linkTracker
					node: Pipewire.defaultAudioSink
				}

				MixerEntry {
					node: Pipewire.defaultAudioSink
				}

				Rectangle {
					Layout.fillWidth: true
					color: palette.active.text
					implicitHeight: 1
				}

				Repeater {
					model: linkTracker.linkGroups

					MixerEntry {
						required property PwLinkGroup modelData
						// Each link group contains a source and a target.
						// Since the target is the default sink, we want the source.
						node: modelData.source
					}
				}
			}
		}
	}
}
