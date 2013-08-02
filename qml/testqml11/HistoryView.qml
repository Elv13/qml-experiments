import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: historyView
    title:"History"
    Rectangle {
       anchors.fill: parent
       CallDelegate {
          id: callDelegate
       }

       Rectangle {

          //Attributes
          width:  parent.width
          height: parent.height
          color:  "black"

          HistoryDelegate {
             id: historyDelegate

          } //historyDelegate

          Flickable {
             width:        parent.width
             height:       parent.height
             contentWidth: parent.width; contentHeight: historyCategories.height
             Column {
                id:historyCategories

                //Attributes
                x:       5
                y:       5
                spacing: 10
                width:   parent.width

                Repeater {
                   //Attributes
                   model: HistoryModel

                   //Content
                   Rectangle {
                      id: categoryRect

                      //Attributes
                      width:  parent.width
                      height: childrenLayout.height + 60
                      color:  "lightgreen"

                      Text { text: display
                         font.pointSize: 10
                         anchors.top:    parent.top
                      } //Text
                      Column {
                         spacing: 4
                         y:       20
                         id:      childrenLayout

                         //Content
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
}
