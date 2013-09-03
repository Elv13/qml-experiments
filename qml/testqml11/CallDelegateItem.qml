import QtQuick 2.0

Rectangle {
   id: callDelegateItem
   anchors.margins: 2
   radius: 5
   color: "lightsteelblue"

   //Properties
   property bool selected: false

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

   onSelectedChanged: {
       console.log(selected+" Selecting item"+display)
       if (selected) {
            callDelegateItem.color = "#ff0000"
       }
       else {
            callDelegateItem.color = "lightsteelblue"
       }

   }
} //Call delegate
