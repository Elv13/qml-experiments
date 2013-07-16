import QtQuick 1.1

Rectangle {
    id: tabView
    z: 1000
    width: 328
    height: 62
    //signal currentPageChanged(string number)
    property string currentPage: "Calls"

    Row {
        id: row1
        x: 0
        y: 0
        width: 328
        height: 62

        spacing: 2
        Rectangle {
            id: rectangle1
            color: "red"
            width: parent.width/4 -1
            height: parent.height
            radius: 5
            Text {
                text:"Calls"
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     console.log("Call tab clicked")
                     parent.parent.parent.currentPage = "Calls"
                 }
            }
        }
        Rectangle {
            color: "green"
            width: parent.width/4 -1
            height: parent.height
            radius: 5
            Text {
                text:"History"
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     console.log("History tab clicked")
                     parent.parent.parent.currentPage = "History"
                 }
            }
        }
        Rectangle {
            color: "blue"
            width: parent.width/4 -1
            height: parent.height
            radius: 5
            Text {
                text:"Contact"
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     console.log("Contact tab clicked")
                    parent.parent.parent.currentPage = "Contact"
                 }
            }
        }
        Rectangle {
            color: "yellow"
            width: parent.width/4 -1
            height: parent.height
            radius: 5
            Text {
                text:"Settings"
                horizontalAlignment: Text.AlignRight
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                 anchors.fill: parent
                 onClicked: {
                    console.log("Settings tab clicked")
                    parent.parent.parent.currentPage = "Settings"
                 }
            }
        }
    }
}
