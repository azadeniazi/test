import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")








    Rectangle {
        color: "lightgray"
        width: parent.width
        height: parent.height

        VisualItemModel {
            id: itemModel

            Rectangle {
                width: view.width; height: view.height
                color: "red"
                Text { text: "Page 1"; font.bold: true; anchors.centerIn: parent }
            }
            Rectangle {
                width: view.width; height: view.height
                color: "blue"
                Text { text: "Page 2"; font.bold: true; anchors.centerIn: parent }
            }
            Rectangle {
                width: view.width; height: view.height
                color: "green"
                Text { text: "Page 3"; font.bold: true; anchors.centerIn: parent }
            }
        }

        ListView {
            id: view
            anchors { fill: parent; bottomMargin: 30 }
            model: itemModel
            preferredHighlightBegin: 0; preferredHighlightEnd: 0
            highlightRangeMode: ListView.StrictlyEnforceRange
            orientation: ListView.Horizontal
            snapMode: ListView.SnapOneItem; flickDeceleration: 2000
        }

        Rectangle {
            width: parent.width; height: 30
            anchors { top: view.bottom; bottom: parent.bottom }
            color: "gray"

            Row {
                anchors.centerIn: parent
                spacing: 20

                Repeater {
                    model: itemModel.count

                    Rectangle {
                        width: 5; height: 5
                        radius: 3
                        color: view.currentIndex == index ? "black" : "white"

                        MouseArea {
                            width: 20; height: 20
                            anchors.centerIn: parent
                            onClicked: view.currentIndex = index
                        }
                    }
                }
            }
        }
    }

}
