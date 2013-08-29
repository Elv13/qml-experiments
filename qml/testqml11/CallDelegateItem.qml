import QtQuick 2.0

Rectangle {
   id: callDelegateItem
   anchors.margins: 2
   radius: 5
   color: "lightsteelblue"
   Column {
      anchors.verticalCenter: parent.verticalCenter
      Text {
         text: display
         color: "black"
         font.bold: true
      }
      Text {
         text: model.number
         color: "black"
      }
   }
} //Call delegate
