import QtQuick 2.0
import Ubuntu.Components 0.1
import SFLPhone 1.0

Page {
    id:callView
    title:"Calls"
    property Item currentItem: null
    property string currentCallId
    Rectangle {
        //anchors.fill:parent.parent
        height:parent.height
        width: parent.width
        CallDelegate {
            id: callDelegate
            property bool selected : false
            onSelectedChanged: {
                console.log("Selection changed")
                if (currentItem != null)
                    currentItem.selected = false

                //currentItem = this
             }
        }

        Rectangle {
            //Geometry
            y:20
            width: parent.width
            height: parent.height - dialPad.height
            anchors.top: parent.parent
            z:2

            //Display
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
            height:180
            width:parent.width
            y:parent.height-dialPad.height -10
            z:10000
        } //Dialpad

        //TODO: remove this once the Ubuntu-SDK support it
        Image {
            anchors.fill: parent
            source: "/home/etudiant/testqml11/ressources/background/ubuntubg.png"
            z: 1
        }


    } //CallView
}
