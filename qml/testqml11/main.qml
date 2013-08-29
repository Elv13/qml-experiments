import QtQuick 2.0
import Ubuntu.Components 0.1

MainView {
   id: mainView

   //Attributes
   width:  329
   height: 543

   //Content
   PageStack {
       id:mainPageStack
       Component.onCompleted: push(callView)
       CallView {
          id:callView

          //Attributes
          objectName:  "callView"
          height:      parent.height -60
          width:       parent.width
          y:200
       }

       HistoryView {
          id:historyView

          //Attributes
          objectName:  "historyView"
          height:      parent.height -60
          width:       parent.width
          visible:     false
       }

       Page {
          id:contactView

          //Attributes
          objectName:  "contactView"
          height:      parent.height -60
          width:       parent.width
          visible:     false
       }

       SettingView {
          id:settingView

          //Attributes
          objectName:  "settingView"
          height:      parent.height -60
          width:       parent.width
          visible:     false
       }

       AccountPage {
           id:accountPage
           objectName:  "accountPage"
           height:      parent.height -60
           width:       parent.width
           visible:     false
       }
       AccountSettings {
           id:accountSettingsPage
           objectName: "accountSettingsPage"
           visible:false
       }
   }

   Row {
       anchors.right: parent.right
       spacing: 10
       anchors.margins: 5
       y:15
       z:100000
       Image {
           source: "/home/etudiant/testqml11/ressources/call.png"
           height: 30
           width: 30
           MouseArea {
              //Attributes
              anchors.fill: parent

              //Events
              onClicked: {
                 console.log("Call tab clicked")
                  mainPageStack.push(callView)
                 //parent.parent.parent.currentPage = "Calls"
              }
           } //MouseArea
       }
       Image {
           source: "/home/etudiant/testqml11/ressources/history.png"
           height: 30
           width: 30
           MouseArea {
              anchors.fill: parent
              onClicked: {
                 console.log("History tab clicked")
                 mainPageStack.push(historyView)
                 //parent.parent.parent.currentPage = "History"
              } //anchors
           } //MouseArea
       }
       Image {
           source: "/home/etudiant/testqml11/ressources/contact.png"
           height: 30
           width: 30
           MouseArea {
                 anchors.fill: parent
                 onClicked: {
                    console.log("Contact tab clicked")
                    parent.parent.parent.currentPage = "Contact"
                 } //onClicked
           } //MouseArea
       }
       Image {
           source: "/home/etudiant/testqml11/ressources/tools.png"
           height: 30
           width: 30
           MouseArea {
                 anchors.fill: parent
                 onClicked: {
                    console.log("Settings tab clicked")
                    mainPageStack.push(accountPage)
                    parent.parent.parent.currentPage = "Settings"
                 } //onClicked
           } //MouseArea
       }
   }

   //State
   states: [
      State {
         name: "Calls"
         PropertyChanges {target: callView   ; visible: true  }
         PropertyChanges {target: historyView; visible: false }
         PropertyChanges {target: settingView; visible: false }
      },
      State {
         name: "History"
         PropertyChanges {target: callView   ; visible: false }
         PropertyChanges {target: historyView; visible: true  }
         PropertyChanges {target: settingView; visible: false }
      },
      State {
         name: "Contact"
         PropertyChanges {target: callView   ; visible: false }
         PropertyChanges {target: historyView; visible: false }
         PropertyChanges {target: settingView; visible: false }
      },
      State {
         name: "Settings"
         PropertyChanges {target: callView   ; visible: false }
         PropertyChanges {target: historyView; visible: false }
         PropertyChanges {target: settingView; visible: true  }
      }
   ]
}
