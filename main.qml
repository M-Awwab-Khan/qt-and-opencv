import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
// import Webcam 1.0
import QtQuick.Controls.Material

Window {
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
        initialItem: "welcomePage.qml"
        anchors.fill: parent
    }


    // Component {
    //     id: scanPage
    //     Item {
    //         width: parent.width
    //         height: parent.height

    //         WebcamItem {
    //             anchors.fill: parent
    //         }

    //         Button {
    //             text: "Quit"
    //             anchors.top: parent.top
    //             anchors.right: parent.right
    //             onClicked: stackView.pop()
    //         }
    //     }
    // }
}
