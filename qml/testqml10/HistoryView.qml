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

        CallDelegate {
            id: historyDelegate
        }

        Flickable {
            width:parent.width
            height:parent.height
            contentWidth: parent.width; contentHeight: historyCats.height
            Column {
                 x: 5; y: 5
                 //id:historyCategories
                 id:historyCats
                 spacing: 10
                 width: parent.width
                 //height:parent.height

                 Repeater {
                    model: HistoryModel
                    Rectangle {
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
                                  model: HistoryModel
                                  delegate: historyDelegate
                                  Component.onCompleted: {
                                      console.log("oui")
                                      childrenView.model.rootIndex = childrenView.model.modelIndex(index)
                                  }
                              } //Visual

                              onModelChanged: {
                                  console.log("here"+index)
                                    childrenView.model.rootIndex = childrenView.model.modelIndex(childrenView.index)
                              }

                          } //Repeater2
                      } //Column2
                  } //Rectable
                 } //Repeater
             } //Column
        } //Flick
    }
}
