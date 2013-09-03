import QtQuick 2.0
import Ubuntu.Components 0.1

Component {
   id: callDelegate


   Item {
       id: item
      width: parent.parent.width
      height: 40
      property bool selected : false

      //If it is not a conference, use this delegate
      CallDelegateItem {
        id:callDelegateItem

        //Geometry
        width: parent.width - 20
        height:36
        y:5
        x:10
        anchors.margins: 2
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 5
        anchors.topMargin: 5
      }

      Rectangle {
         id: confDelegateItem

         //Geometry
         height: confDelegateLayout.height + 40
         width:parent.width -20
         anchors.topMargin: 10
         anchors.margins: 2
         visible: false
         x: 10
         y:5

         //Display
         color:"transparent"
         radius: 5
         border.color:"#cccccc"
         border.width: 2

         Component {
            id:confItemDelegate
            CallDelegateItem {
              width:parent.parent.width - 20
              height:40
            }
         }

         Text {
            y:parent.y+5
            x:parent.x+5
            text:"Conference"
            font.bold: true
            font.underline: true
            color:"#cccccc"
         }

         Column {
            id: confDelegateLayout
            y:30
            width: parent.width - 20
            x: 10
            //anchors.fill: parent
            anchors.margins: 2
            spacing: 4
            Repeater {
               id:confDelegateRepeater
               model:VisualDataModel {
                  id:confDelegateVisualDataModel
               }
            }
         }
      } //Conference delegate

      ToolBar {
          id:toolbar
          height:60
          width:callDelegateItem.width
          x:10
          visible: false
          y:parent.height - 60
      }

      Component.onCompleted: {
          if (model.isConference === true) {
            callDelegateItem.visible = false
            confDelegateItem.visible = true
            confDelegateVisualDataModel.model = CallModel
            confDelegateVisualDataModel.delegate = confItemDelegate
            confDelegateRepeater.model.rootIndex = confDelegateRepeater.model.modelIndex(index)
          }
      }

      MouseArea {
            anchors.fill: parent
            onClicked: {
                item.selected = true
            } //onClicked
      } //MouseArea

      onSelectedChanged: {
          console.log("HERE"+selected)
          if (model.isConference === true) {

          }
          else {
              callDelegateItem.selected = selected
          }
          if (callView.currentItem && callView.currentItem != item) {
              console.log("TRY TO UNSELECT")
              callView.currentItem.selected = false
          }
          if (selected) {
            callView.currentItem = item
              console.log("BOOM"+model.id)
            callView.currentCallId = model.id
            height = 100
              toolbar.visible = true
          }
          else {
              height = 40
              toolbar.visible = false
          }
      }
   }
}
