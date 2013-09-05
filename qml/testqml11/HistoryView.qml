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
          height: parent.height - historySearch.height -10
          width: parent.width
          color:"transparent"
          z:2
          clip:true

          HistoryDelegate {
             id: historyDelegate

          } //historyDelegate

          Flickable {
             anchors.fill: parent
             y:20
             contentWidth: parent.width; contentHeight: historyCategories.height
             //boundsBehavior:Flickable.StopAtBounds

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
                      height: childrenLayout.height + categoryHeader.height + 20

                      ListItem.Header {
                          id: categoryHeader
                          text: display
                      }
                      Column {
                         spacing: 10
                         anchors.top: categoryHeader.bottom
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


       Image {
           anchors.fill: parent
           source: "/home/etudiant/testqml11/ressources/background/ubuntubg.png"
       }
       TextField {
            id:historySearch
            width:parent.width
            placeholderText: "Search"
            y:parent.height-height -10
        }
    }
}
