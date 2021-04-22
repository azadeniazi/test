import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    CheckBox {
               id: chkPlatformAutoRepeat
               text: "platformAutoRepeat"
               anchors.top: botton1.bottom
           }
    Row {
        id : row1
        anchors.top: chkPlatformAutoRepeat.bottom
          Button {
              text: "Ok"
              onClicked: model.submit()
          }
          Button {
              text: "Cancel"
              onClicked: model.revert()
          }
      }

    Button {
         anchors.top:row1.bottom
          id: control
          text: qsTr("Button1")
          enabled: false
          contentItem: Text {
              text: control.text
              font: control.font
              opacity: enabled ? 1.0 : 0.3
              color: control.down ? "#17a81a" : "#21be2b"
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              elide: Text.ElideRight
          }

          background: Rectangle {
              implicitWidth:100
              implicitHeight: 40
              opacity: enabled ? 1 : 0.3
              border.color: control.down ? "red" : "21be2b"
              border.width: 1
              radius: 2
          }
      }


    CheckBox {
        anchors.centerIn: parent
         id: control1
         text: "CheckBox"
         checked: true

         indicator: Rectangle {
             implicitWidth: 26
             implicitHeight: 26
             x: control1.leftPadding
             y: parent.height / 2 - height / 2
             radius: 3
             border.color: control1.down ? "red" : "green"

             Rectangle {
                 width: 14
                 height: 14
                 x: 6
                 y: 6
                 radius: 2
                 color: control1.down ? "blue" : "red"
                 visible: control1.checked
             }
         }

         contentItem: Text {
             text: control1.text
             font: control1.font
             opacity: enabled ? 1.0 : 0.3
             color: control1.down ? "grey" : "red"
             verticalAlignment: Text.AlignVCenter
             leftPadding: control1.indicator.width + control.spacing
         }
     }
  }
