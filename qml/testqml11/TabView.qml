import QtQuick 2.0
import Ubuntu.Components 0.1

Rectangle {
   
   id:     tabView

   //Attributes
   z:      1000
   width:  328
   height: 62

   //Properties
   property string currentPage: "Calls"

   //View
   Row {
      id:      row1
      x:       0
      y:       0
      width:   328
      height:  62
      spacing: 2

      Rectangle {
         id: rectangle1

         //Attributes
         color:  "red"
         width:  parent.width/4 -1
         height: parent.height
         radius: 5

         Text {
            //Attributes
            text:                     "Calls"
            horizontalAlignment:      Text.AlignHCenter
            font.bold:                true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:   parent.verticalCenter
         } //Text

         MouseArea {
            //Attributes
            anchors.fill: parent

            //Events
            onClicked: {
               console.log("Call tab clicked")
                mainPageStack.push(callView)
               //parent.parent.parent.currentPage = "Calls"
            }
         } //MouseArea
      } //rectangle1

      Rectangle {
         //Attributes
         color: "green"
         width:  parent.width/4 -1
         height: parent.height
         radius: 5

         //Content
         Text {
            text:                     "History"
            horizontalAlignment:      Text.AlignHCenter
            font.bold:                true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:   parent.verticalCenter
         } //Text
         MouseArea {
            anchors.fill: parent
            onClicked: {
               console.log("History tab clicked")
               mainPageStack.push(historyView)
               //parent.parent.parent.currentPage = "History"
            } //anchors
         } //MouseArea
      } //Rectangle

      Rectangle {
         //Attributes
         color:  "blue"
         width:  parent.width/4 -1
         height: parent.height
         radius: 5

         //Content
         Text {
            text:                     "Contact"
            horizontalAlignment:      Text.AlignHCenter
            font.bold:                true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:   parent.verticalCenter
         } //Text
         MouseArea {
               anchors.fill: parent
               onClicked: {
                  console.log("Contact tab clicked")
                  parent.parent.parent.currentPage = "Contact"
               } //onClicked
         } //MouseArea
      } //Rectangle

      Rectangle {
         //Attributes
         color:  "yellow"
         width:  parent.width/4 -1
         height: parent.height
         radius: 5

         //Content
         Text {
               text:                     "Settings"
               horizontalAlignment:      Text.AlignRight
               font.bold:                true
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter:   parent.verticalCenter
         } //Text
         MouseArea {
               anchors.fill: parent
               onClicked: {
                  console.log("Settings tab clicked")
                  mainPageStack.push(accountPage)
                  parent.parent.parent.currentPage = "Settings"
               } //onClicked
         } //MouseArea
      }
   }
}
