import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id:callView
    anchors.fill:parent
    title:"Calls"
    Rectangle {
        anchors.fill:parent
        CallDelegate {
            id: callDelegate
        }

        Rectangle {
            width: parent.width
            height: parent.height - dialPad.height
            color: "black"

            ListView {
                id: callList
                anchors.top: parent.top
                width:parent.width
                height:parent.height
                anchors.fill: parent
                delegate: callDelegate
                model: CallModel
            }
        }

        DialPad {
            id: dialPad
            height:200
            width:parent.width
            anchors.top:callView.bottom
        }

    }
}
