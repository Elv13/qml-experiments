import QtQuick 1.1

Rectangle {
    id: callDelegate
    //property QModelIndex model
    property string display : ""
    Item {
        width: parent.parent.width
        height: 40
        Rectangle {
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
               /* Text {
                    text: model.number
                    color: "black"
                }*/
            }
        }
    }
}
