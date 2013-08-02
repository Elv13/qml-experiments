import QtQuick 2.0
import Ubuntu.Components 0.1

Component {
    id: callDelegate
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
                Text {
                    text: model.number
                    color: "black"
                }
            }
        }
    }
}
