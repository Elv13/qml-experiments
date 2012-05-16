import QtQuick 1.1
import org.kde.plasma.components 0.1 as Plasma
import org.kde.plasma.core       0.1 as PlasmaCore

Rectangle/*Plasma.Page */{
      anchors.top: tabs.bottom
      width:parent.width
      height:parent.height - tabs.height
      id:callTab

      Plasma.TextArea {
         id:display
         width:parent.width
         height:parent.height-250
         focus:true
         readOnly:true
         
         function addText(text) {
            display.text = display.text+text
         }

         Keys.onPressed: {
            console.log("Key pressed")
            display.addText(event.key)
         }
         Keys.onReturnPressed: {
            console.log("Call")

         }
      }

   Image {
      source: "plasmapackage:/images/phone.svg";
      width:parent.width
      fillMode: Image.PreserveAspectFit
      height:parent.height-250
   }

   DialPad {
      id: dialPad
      width:parent.width
      height:200
   }

   Rectangle {
      width:parent.width
      height:50
      anchors {
         top: dialPad.bottom;
         left: parent.left;
         right: parent.right;
      }
      Row {
         width:parent.width
         height:parent.height
         Plasma.Button {
            width:parent.width/5
            height:parent.height
            iconSource: "list-add-user"
            onClicked: {
               call("112")
            }
         }
         Plasma.Button {
            width:parent.width/5 * 3
            height:parent.height
            iconSource: "call-start"
            onClicked: {
               call("112")
            }
         }
         Plasma.Button {
            width:parent.width/5
            height:parent.height
            iconSource: "edit-clear-locationbar-rtl"
            onClicked: {
               call("112")
            }
         }
      }
   }
}