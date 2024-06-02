import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Webcam 1.0
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: qsTr("OMR Scanner")

    // Set the Material style
    Material.theme: Material.Light // or Material.Light
    Material.primary: Material.Blue
    Material.accent: Material.Pink

    StackView {
        id: stackView
        initialItem: welcomePage
        anchors.fill: parent
    }

    Component {
        id: welcomePage
            RowLayout {
                spacing: 10
                width: parent.width * 0.8
                height: parent.height * 0.6

                Image {
                    source: "qrc:/qtandopencv/assets/images/welcome-withoutbg.png"  // Path to the image
                    Layout.maximumWidth: parent.width * 0.6
                    Layout.maximumHeight: parent.height * 0.6
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignVCenter
                }

                ColumnLayout {
                    spacing: 20
                    width: parent.width * 0.4
                    anchors.verticalCenter: parent

                    Text {
                        text: qsTr("Welcome to your Teaching Assistant")
                        font.pixelSize: 24
                        Layout.maximumWidth: parent.width
                        wrapMode: Text.WordWrap
                        font.bold: true
                        color: "#333333"  // Dark grey color
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    }

                    Text {
                        text: qsTr("Grade your students' tests using OMR and use Virtual Whiteboard to conduct live sessions.")
                        font.pixelSize: 16
                        Layout.maximumWidth: parent.width
                        wrapMode: Text.WordWrap
                        color: "#666666"  // Medium grey color
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    }

                    Button {
                        text: qsTr("Get Started")
                        width: 150
                        height: 40
                        Material.background: "#6C63FF"

                        font.pixelSize: 16
                        font.bold: true
                        contentItem: Text {
                            text: qsTr("Get Started")
                            color: "white"
                            font.pixelSize: 16
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        onClicked: {
                            stackView.push("classesPage.qml")
                        }
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
