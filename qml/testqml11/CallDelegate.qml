import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

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
        width:           parent.width - 20
        height:          36
        y:               5
        x:               10
        anchors.margins: 2
      }

      Rectangle {
         id: confDelegateItem

         //Geometry
         height:            confDelegateLayout.height + 40
         width:             parent.width -20
         anchors.topMargin: 10
         anchors.margins:   2
         visible:           false
         x:                 10
         y:                 5

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

         Row {
             y:parent.y
             x:parent.x
             spacing: 4
             Image {
                 source: "/home/etudiant/testqml11/ressources/contact.png"
                 height: 20
                 width: 20
             }

             Label {
                text:"Conference"
                font.bold: true
                font.underline: true
                color: Theme.palette.normal.foregroundText
             }
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
          id: toolbar
          height:  60
          width:   callDelegateItem.width
          x:       10
          visible: false
          y:       parent.height - 60
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
          if (model.isConference == true) {

          }
          else {
              callDelegateItem.selected = selected
          }
          if (callView.currentItem && callView.currentItem != item) {
            callView.currentItem.selected = false
          }
          if (selected) {
            callView.currentItem = item
            callView.currentCallId = model.id
            height = 100
            toolbar.visible = true
          }
          else {
              height = 40
              toolbar.visible = false
          }
      }

      ListItem.Header {
        height: 3
        y: -2
      }
   }
}
