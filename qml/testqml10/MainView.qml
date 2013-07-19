import QtQuick 1.1

Rectangle {
    id: mainView
    width: 329
    height: 543
    TabView {
        id: tabView
        x: 0
        y: 0
        width: parent.width
        height: 62
        color: "#ffffff"
        onCurrentPageChanged: {
            parent.state = currentPage
        }
    }
   // property CallView callView
    CallView {
        id:callView
        objectName: "callView"
        anchors.top: tabView.bottom
        height: parent.height - tabView.height
        width:parent.width
    }

    HistoryView {
        id:historyView
        objectName: "historyView"
        anchors.top: tabView.bottom
        height: parent.height - tabView.height
        width:parent.width
        visible:false
    }

    ListView {
        id:contactView
        objectName: "contactView"
        anchors.top: tabView.bottom
        height: parent.height - tabView.height
        width:parent.width
        visible:false
    }

    SettingView {
        id:settingView
        objectName: "settingView"
        anchors.top: tabView.bottom
        height: parent.height - tabView.height
        width:parent.width
        visible:false
    }

    states: [
        State {
            name: "Calls"
            PropertyChanges {target: callView; visible: true }
            PropertyChanges {target: historyView; visible: false }
            PropertyChanges {target: settingView; visible: false }
        },
        State {
            name: "History"
            PropertyChanges {target: callView; visible: false }
            PropertyChanges {target: historyView; visible: true }
            PropertyChanges {target: settingView; visible: false }
        },
        State {
            name: "Contact"
            PropertyChanges {target: callView; visible: false }
            PropertyChanges {target: historyView; visible: false }
            PropertyChanges {target: settingView; visible: false }
        },
        State {
            name: "Settings"
            PropertyChanges {target: callView; visible: false }
            PropertyChanges {target: historyView; visible: false }
            PropertyChanges {target: settingView; visible: true }
        }
    ]
}
