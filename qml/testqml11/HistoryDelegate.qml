import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Component {
    id: callDelegate
    Item {
        width: parent.parent.width
        height: 40
        Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            radius: 5
            color: "transparent"
            Row {
                spacing: 5
                UbuntuShape {
                    objectName: "ubuntushape_image"
                    radius: "medium"
                    image: Image {
                        source: "/home/etudiant/testqml11/ressources/big-bird.jpg"
                        fillMode: Image.PreserveAspectCrop
                    }
                    height:40
                    width:40
                }

               Column {
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        text: display
                        color: Theme.palette.normal.foregroundText
                        fontSize : "medium"
                    }
                    Label {
                        text: model.number
                        color: Theme.palette.normal.backgroundText
                        fontSize : "small"
                    }
                }
            }
        }
    }
}
