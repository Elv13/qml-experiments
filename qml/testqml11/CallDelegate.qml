import QtQuick 2.0
import Ubuntu.Components 0.1

Component {
   id: callDelegate
   Item {
      width: parent.parent.width
      height: 40

      CallDelegateItem {
        id:callDelegateItem
        anchors.fill: parent
      }

      Rectangle {
         id: confDelegateItem
         height: confDelegateLayout.height + 40
         width:parent.width - 20
         anchors.margins: 2
         visible: false
         color:"transparent"
         radius: 5
         border.color:"#cccccc"
         border.width: 2
         x:parent.x+10
         
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

      Component.onCompleted: {
          if (model.isConference === true) {
            console.log("in the if")
            callDelegateItem.visible = false
            confDelegateItem.visible = true
            confDelegateVisualDataModel.model = CallModel
            confDelegateVisualDataModel.delegate = confItemDelegate
            confDelegateRepeater.model.rootIndex = confDelegateRepeater.model.modelIndex(index)
          }
      }
   }
}
