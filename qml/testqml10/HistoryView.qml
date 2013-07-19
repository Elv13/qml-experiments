import QtQuick 1.1

Rectangle {
   CallDelegate {
      id: callDelegate
   }

   Rectangle {
      id: historyView
      width: parent.width
      height: parent.height
      color: "black"

      HistoryDelegate {
         id: historyDelegate
      } //historyDelegate

      Flickable {
         width:parent.width
         height:parent.height
         contentWidth: parent.width; contentHeight: historyCategories.height
         Column {
            x: 5; y: 5
            id:historyCategories
            spacing: 10
            width: parent.width

            Repeater {
               model: HistoryModel
               Rectangle {
                  id: categoryRect
                  width: parent.width
                  height: childrenLayout.height + 60
                  color: "lightgreen"

                  Text { text: display
                     font.pointSize: 10
                     anchors.top: parent.top
                  } //Text
                  Column {
                     spacing: 4
                     y:20
                     id:childrenLayout
                     Repeater {
                        id: childrenView
                        model:VisualDataModel {
                           id:childrenVisualDataModel
                           model: HistoryModel
                           Component.onCompleted: {
                              childrenView.model.rootIndex = childrenView.model.modelIndex(index)
                              childrenVisualDataModel.delegate = historyDelegate
                           }
                        } //childrenVisualDataModel
                     } //childrenView
                  } //childrenLayout
               } //categoryRect
            } //HistoryModel Repeater
         } //Column
      } //Flick
   } //historyView
}
