import QtQuick 2.0
import SFLPhone 1.0

Rectangle {
    id: toolbar

    //Display
    color:"#722c48"
    ListModel {
        id:buttonModel
        ListElement {
            title:   "Pick up"
            action:  UserActionModel.PICKUP
            icon:    "/home/etudiant/testqml11/ressources/callstate/pickup_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Hold"
            action:  UserActionModel.HOLD
            icon:    "/home/etudiant/testqml11/ressources/callstate/hold_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Unhold"
            action:  UserActionModel.UNHOLD
            icon:    "/home/etudiant/testqml11/ressources/callstate/unhold_grayscale.png"
            visible: false
        }
        ListElement {
            title:     "Hang up"
            action:    UserActionModel.HANGUP
            icon:      "/home/etudiant/testqml11/ressources/callstate/hangup_grayscale.png"
            fullwidth: true
            visible:   false
            bg:        "#771111"
        }
        ListElement {
            title:   "Mute"
            action:  UserActionModel.MUTE
            icon:    "/home/etudiant/testqml11/ressources/callstate/mutemic_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Transfer"
            action:  UserActionModel.TRANSFER
            icon:    "/home/etudiant/testqml11/ressources/callstate/transfer_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Record"
            action:  UserActionModel.RECORD
            icon:    "/home/etudiant/testqml11/ressources/callstate/record_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Refuse"
            action:  UserActionModel.REFUSE
            icon:    "/home/etudiant/testqml11/ressources/callstate/refuse_grayscale.png"
            visible: false
        }
        ListElement {
            title:   "Accept"
            action:  UserActionModel.ACCEPT
            icon:    "/home/etudiant/testqml11/ressources/callstate/pickup_grayscale.png"
            visible: false
        }
    }
    Repeater {
        id:toolbarGrid
        anchors.fill: parent
        model: buttonModel
        Rectangle {
            //Code
            function isVisible() {
                var call = CallModel.getCall(callView.currentCallId)
                return ((!callView.currentCallId) || (!call))?
                    false:call.userActionModel.isActionEnabled(
                       model.action,call.state
                    )
            }

            //Compute optimal geometry
            function getGeometry() {
                var call = CallModel.getCall(callView.currentCallId)
                if (!call)
                    return {x:0,y:0,width:0,height:0}
                var v = isVisible()
                if (!v)
                    return {x:0,y:0,width:0,height:0}

                var relIdx = call.userActionModel.relativeIndex(model.action)
                var isHangUpEnabled = call.userActionModel.isActionEnabled(UserActionModel.HANGUP)
                var divider = (Math.floor((call.userActionModel.enabledCount-(isHangUpEnabled?1:0)-1)/3)+1)+((isHangUpEnabled && Math.floor(call.userActionModel.relativeIndex(UserActionModel.HANGUP)/3) != 0)?1:0)

                if (model.fullwidth == true) {
                    return {
                        x:      0,
                        y:      toolbar.height-(toolbar.height/divider),
                        width:  callDelegateItem.width,
                        height: toolbar.height/divider,
                    }
                }

                var addspace = 0
                if (call.userActionModel.enabledCount - (isHangUpEnabled?1:0)==relIdx+1) {
                    addspace = callDelegateItem.width-((callDelegateItem.width/3)*(relIdx%3)+callDelegateItem.width/3)//((call.userActionModel.enabledCount)%3)*(callDelegateItem.width/3)
                }


                return {
                    x:      (callDelegateItem.width/3)*(relIdx%3),
                    y:      (toolbar.height/divider)*Math.floor(relIdx/3),
                    width:  callDelegateItem.width/3 + addspace,
                    height: toolbar.height/divider,
                }
            }

            //Geometry
            width:    getGeometry().width
            height:   getGeometry().height
            x:        getGeometry().x
            y:        getGeometry().y
            visible:  isVisible()

            //Display
            anchors.margins: 2
            color:           model.bg?bg: "transparent"
            border.color:    "white"//Theme.palette.normal.baseText
            border.width:    1
            radius:          2

            //Content
            Text {
                id:buttonText

                //Geometry
                x: parent.height + 8

                //Display
                text:  title
                color: "white"//Theme.palette.normal.baseText
                anchors.verticalCenter:   parent.verticalCenter
            }

            //Icon
            Image {
                //Geometry
                width:  parent.height
                height: parent.height
                x:      4

                //Content
                source: model.icon
            }

            //Background
            /*Image { //SEGFAULT WHEN THIS IS ENABLED
                anchors.fill: parent
                fillMode: Image.Tile
                z:-1
                source: "/home/etudiant/testqml11/ressources/background/stripe1.png"
            }*/
        }//Delegate
    }

    onVisibleChanged: {

    }
}
