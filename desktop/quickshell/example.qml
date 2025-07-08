import Quickshell
import Quickshell.Io
import QtQuick

Variants {
	model: Quickshell.screens;
	
	delegate: Component {
		PanelWindow {
			property var modelData

			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}
		
			implicitHeight: 30
		
			Text {
				id: clock
				anchors.centerIn: parent
		
				Process {
					command: ["date"]
		
					running: true
		
					stdout: StdioCollector {
						onStreamFinished: clock.text = this.text
					}
				}
			}
		}
	}
}
