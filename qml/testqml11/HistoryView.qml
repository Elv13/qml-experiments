import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Page {
    id: historyView
    title:"History"
    Rectangle {
        height:parent.height
        width: parent.width
       CallDelegate {
          id: callDelegate
       }

       Rectangle {

          //Attributes
          anchors.fill: parent

          Image {
              anchors.fill: parent
              source: "/home/etudiant/testqml11/ressources/background/ubuntubg.png"
              z: 1
          }

          HistoryDelegate {
             id: historyDelegate

          } //historyDelegate

          Flickable {
             width:        parent.width
             height:       parent.height - historySearch.height
             contentWidth: parent.width; contentHeight: historyCategories.height
             z:2
             y:20
             Column {
                id:historyCategories

                //Attributes
                x:       5
                y:       15
                spacing: 10
                width:   parent.width

                Repeater {
                   //Attributes
                   model: HistoryModel

                   //Content
                   Item {
                      id: categoryRect

                      //Attributes
                      width:  parent.width
                      height: childrenLayout.height + 60

                      ListItem.Header { text: display }
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
       TextField {
            id:historySearch
            width:parent.width
            placeholderText: "Search"
            y:parent.height-height -10
        }
    }
}
