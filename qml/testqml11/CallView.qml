import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id:callView
    //anchors.fill:parent
    title:"Calls"
    Rectangle {
        //anchors.fill:parent.parent
        height:parent.height
        width: parent.width
        CallDelegate {
            id: callDelegate
        }

        Rectangle {
            width: parent.width
            height: parent.height - dialPad.height
            anchors.top: parent.parent.top +100
            z:2
            color:"transparent"

            ListView {
                id: callList
                anchors.top: parent.top
                width:parent.width
                height:parent.height
                anchors.fill: parent
                delegate: callDelegate
                model: CallModel
            } //CallList
        }

        DialPad {
            id: dialPad
            height:200
            width:parent.width
            anchors.bottom: parent.bottom
            z:10000
        } //Dialpad*/

        Image {
            anchors.fill: parent
            source: "/home/etudiant/testqml11/ressources/background/ubuntubg.png"
            z: 1
        }

    }
}
