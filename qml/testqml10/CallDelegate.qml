import QtQuick 1.1

Component {
   id: callDelegate
   Item {
      width: parent.parent.width
      height: 40
      Rectangle {
         id: callDelegateItem
         anchors.fill: parent
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
      }

      Rectangle {
         id: confDelegateItem
         height: confDelegateLayout.height + 40
         width:parent.width
         anchors.margins: 2
         visible: false
         color:"red"
         
         Component {
            id:confItemDelegate
            Rectangle {
               width:parent.parent.width - 20
               height:50
               color:"blue"
               Text {
                  anchors.top:parent.top
                  text:display
               }
            }
         }
         
         Text {
            anchors.top:parent.top
            text:"Conference"
         }
         
         Column {
            id: confDelegateLayout
            y:20
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
      }

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
