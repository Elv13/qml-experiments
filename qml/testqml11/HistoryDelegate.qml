import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Component {
    id: historyDelegate
    Item {
        id: historyDelegateItem
        property bool selected: false
        property string color: "transparent"

        ListItem.Header {
            height:3
            y:historyDelegateRect.y + historyDelegateItem.height  + 5
        }
        width: parent.parent.width - 10
        height: 40
        Rectangle {
            id: historyDelegateRect
            height:40
            width:parent.width
            anchors.margins: 2
            radius:          5
            color:           "transparent"

            Row {
                spacing: 5
                UbuntuShape {
                    objectName: "ubuntushape_image"
                    radius:     "medium"
                    image: Image {
                        source:   "/home/etudiant/testqml11/ressources/big-bird.jpg"
                        fillMode: Image.PreserveAspectCrop
                    }
                    height: 40
                    width:  40
                }

               Column {
                    anchors.leftMargin:     10
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        text:      display
                        color:     Theme.palette.normal.foregroundText
                        fontSize : "medium"
                    }
                    Label {
                        text:     model.number
                        color:    Theme.palette.normal.backgroundText
                        fontSize: "small"
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (historyView.currentItemAAA) {
                        historyView.currentItemAAA.selected = false
                    }

                    historyDelegateItem.selected = true
                    historyView.currentItemAAA   = historyDelegateItem
                }
            }
        }
        Rectangle {
            id:callAgainButton
            height:40
            width:historyDelegateRect.width
            x:historyDelegateRect.x
            anchors.top:historyDelegateRect.bottom
            visible:false
            radius:3
            color:"transparent"
            border.color: "white"
            border.width: 1
            Row {
                anchors.horizontalCenter:   parent.horizontalCenter
                anchors.verticalCenter:   callAgainButton.verticalCenter
                spacing: 4
                Image {
                    source:"/home/etudiant/testqml11/ressources/callstate/transfer_grayscale.png"
                    height: 20
                    width:20
                    anchors.verticalCenter:   callAgainButton.verticalCenter
                }
                Text {
                    text: "Call Again"
                    anchors.verticalCenter:   callAgainButton.verticalCenter
                    color:Theme.palette.normal.foregroundText
                }
            }
        }

        onSelectedChanged: {
            if (selected) {
                historyDelegateRect.color = "red"
                callAgainButton.visible = true
                historyDelegateItem.height = 80
            }
            else {
                historyDelegateRect.color = "transparent"
                historyDelegateItem.height = 40
                callAgainButton.visible = false
            }
        }
    }
}
