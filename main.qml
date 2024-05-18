import QtQuick
import QtQuick.Window
import QtQuick.Controls
import Webcam 1.0
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("OMR Scanner")

    // Set the Material style
    Material.theme: Material.Light // or Material.Light
    Material.primary: Material.Blue
    Material.accent: Material.Pink

    StackView {
        id: stackView
        initialItem: menuPage
        anchors.fill: parent
    }

    Component {
        id: menuPage
        Item {
            width: parent.width
            height: parent.height
            Rectangle {
                anchors.centerIn: parent
                width: 200
                height: 100
                color: "transparent"

                Button {
                    text: "Scan Quiz"
                    anchors.centerIn: parent
                    onClicked: stackView.push(scanPage)
                }
            }
        }
    }

    Component {
        id: scanPage
        Item {
            width: parent.width
            height: parent.height

            WebcamItem {
                anchors.fill: parent
            }

            Button {
                text: "Quit"
                anchors.top: parent.top
                anchors.right: parent.right
                onClicked: stackView.pop()
            }
        }
    }
}
