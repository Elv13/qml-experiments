import QtQuick 2.0
import Ubuntu.Components 0.1

Rectangle {
   id: callDelegateItem
   anchors.margins: 2
   radius: 5
   color: "transparent"

   //Properties
   property bool selected: false

   Row {
       function getStateImage() {
           var state = model.state
           return "/home/etudiant/testqml11/ressources/callstate2/hold.png"
       }

       UbuntuShape {
           objectName: "ubuntushape_image"
           radius: "medium"
           image: Image {
               source: "/home/etudiant/testqml11/ressources/callstate2/hold.png" //getStateImage()
               fillMode: Image.PreserveAspectCrop
           }
           height:40
           width:40
       }


       Column {
          anchors.verticalCenter: parent.verticalCenter
          Text {
             text: display
             color: Theme.palette.normal.foregroundText
             font.bold: true
          }
          Text {
             text: model.number
             color: Theme.palette.normal.backgroundText
          }
       }
   }

   onSelectedChanged: {
       console.log(selected+" Selecting item"+display)
       if (selected) {
            callDelegateItem.color = "#ff0000"
       }
       else {
            callDelegateItem.color = "transparent"
       }
   }
} //Call delegate
