import QtQuick 1.1

Rectangle {
    CallDelegate {
        id: callDelegate
    }

    Rectangle {
        id: callView
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
