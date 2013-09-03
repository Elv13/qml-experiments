import QtQuick 2.0
import SFLPhone 1.0

Rectangle {
    color:"#722c48"
    ListModel {
        id:buttonModel
        ListElement {
            title: "Pick up"
            action: Call.PICKUP
            icon: "/home/etudiant/testqml11/ressources/callstate/pickup_grayscale.png"
        }
        ListElement {
            title: "Hold"
            action: Call.HOLD
            icon: "/home/etudiant/testqml11/ressources/callstate/hold_grayscale.png"
        }
        ListElement {
            title: "Unhold"
            action: Call.UNHOLD
            icon: "/home/etudiant/testqml11/ressources/callstate/unhold_grayscale.png"
        }
        ListElement {
            title: "Hang up"
            action: Call.HANGUP
            icon: "/home/etudiant/testqml11/ressources/callstate/hangup_grayscale.png"
        }
        ListElement {
            title: "Mute"
            action: Call.MUTE
            icon: "/home/etudiant/testqml11/ressources/callstate/mutemic_grayscale.png"
        }
        ListElement {
            title: "Transfer"
            action: Call.TRANSFER
            icon: "/home/etudiant/testqml11/ressources/callstate/transfer_grayscale.png"
        }
        ListElement {
            title: "Record"
            action: Call.RECORD
            icon: "/home/etudiant/testqml11/ressources/callstate/record_grayscale.png"
        }
        ListElement {
            title: "Refuse"
            action: Call.REFUSE
            icon: "/home/etudiant/testqml11/ressources/callstate/refuse_grayscale.png"
        }
        ListElement {
            title: "Accept"
            action: Call.ACCEPT
            icon: "/home/etudiant/testqml11/ressources/callstate/pickup_grayscale.png"
        }
    }
    GridView {
        id:toolbarGrid
        anchors.fill: parent
        model: buttonModel
        cellWidth: width/3; cellHeight: height/3
        delegate: Rectangle {
            width: toolbarGrid.cellWidth
            height: toolbarGrid.cellHeight
            anchors.margins: 2
            color:"transparent"
            border.color: "white"//Theme.palette.normal.baseText
            border.width: 1
            radius:2
            visible: CallModel.getCall(callView.currentCallId).isActionEnabled(
                         action,CallModel.getCall(callView.currentCallId).state
                    )
            Text {
                id:buttonText
                text: title
                color:"white"//Theme.palette.normal.baseText
                anchors.verticalCenter:   parent.verticalCenter
                x: toolbarGrid.cellHeight + 8
            }
            Image {
                width:toolbarGrid.cellHeight
                height:toolbarGrid.cellHeight
                source: model.icon
                x: 4
            }
        }
    }

    onVisibleChanged: {
        //console.log("Visibility"+Call.ACCEPT+"end")
        //console.log("PICKUP IS "+Call.TRANSFER+" "+callView.currentItem+ " "+CallModel.getCall(callView.currentCallId).state)
    }
}
