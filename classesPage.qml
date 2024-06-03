import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: classesScreen

    Rectangle {
        id: rootFrame
        anchors.fill: parent
        color: "#FFFFFF"

        ColumnLayout {
            anchors.fill: parent
            spacing: 20

            // Top bar with Back button and Profile icon
            Rectangle {
                id: topBar
                height: 50
                color: "#E0E0FF"
                anchors {
                    left: parent.left
                    top: parent.top
                    right: parent.right
                }

                Button {
                    text: qsTr("<- Back")
                    background: Rectangle {
                        color: "transparent"  // Light purple color
                        radius: 10
                    }
                    palette.buttonText: "#6C63FE"
                    font.pixelSize: 16
                    font.bold: true
                    onClicked: {
                        stackView.pop()
                    }
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                }


                Button {
                    background: Rectangle {
                        color: "#6C63FE"
                        radius: 10
                    }
                    height: 50
                    width: 50
                    Image {
                        source: "https://icons.veryicon.com/png/o/miscellaneous/rookie-official-icon-gallery/225-default-avatar.png"
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent

                    }
                    anchors.right: parent.right
                    anchors.margins: 50
                }

            }

            Rectangle {
                id: headingBar
                anchors.top: topBar.bottom
                Layout.preferredWidth: parent.width * 0.9
                Layout.alignment: Qt.AlignHCenter
                anchors.margins: 30

                RowLayout {
                    width: parent.width
                    height: 40
                    Layout.alignment: Qt.AlignTop

                    Text {
                        text: qsTr("Classes")
                        font.pixelSize: 24
                        font.bold: true
                        color: "#6C63FE"  // Purple color
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    }

                    Button {
                        text: qsTr("+ Add Class")
                        background: Rectangle {
                            color: "#6C63FE"  // Purple color
                            radius: 10
                        }
                        font.pixelSize: 16
                        font.bold: true
                        contentItem: Text {
                            text: qsTr("+ Add Class")
                            color: "white"
                            font.pixelSize: 16
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight
                        onClicked: {
                            // Handle add class action here
                        }
                    }
                }

            }

            // Grid of class cards
            Rectangle {
                anchors.top: headingBar.bottom
                anchors.right:
                color: "#555555"

                GridView {
                    width: parent.width
                    height: parent.height - 120  // Adjust height as necessary
                    cellWidth: parent.width / 3 - 20
                    cellHeight: 150
                    model: ListModel {
                        // Example data
                        ListElement { className: "Class 9"; teacherName: "Chemistry Teacher"; studentCount: 60; centerName: "Practical Center" }
                        ListElement { className: "Class 10"; teacherName: "Math Teacher"; studentCount: 45; centerName: "Science Center" }
                        // Add more classes as needed
                    }
                    delegate: Rectangle {
                        width: parent.cellWidth
                        height: parent.cellHeight
                        color: "#E0E0FF"  // Light purple color
                        radius: 10
                        border.color: "#CCCCFF"
                        border.width: 1
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // Handle class card click here
                                console.log("Class clicked: " + className)
                            }
                        }
                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 5

                            Text {
                                text: model.className
                                font.pixelSize: 18
                                font.bold: true
                                color: "#333333"
                            }

                            Text {
                                text: model.teacherName
                                font.pixelSize: 14
                                color: "#666666"
                            }

                            RowLayout {
                                spacing: 10
                                Text {
                                    text: "👤 " + model.studentCount
                                    font.pixelSize: 14
                                    color: "#666666"
                                }
                            }

                            Text {
                                text: model.centerName
                                font.pixelSize: 14
                                color: "#666666"
                            }
                        }
                    }
                }


            }

        }
    }
}
