import QtQuick 1.1

Rectangle {
   id: mainView

   //Attributes
   width:  329
   height: 543

   //Content
   TabView {
      id: tabView

      //Attributes
      x:      0
      y:      0
      width:  parent.width
      height: 62
      color:  "#ffffff"

      //Events
      onCurrentPageChanged: {
         parent.state = currentPage
      }
   }

   CallView {
      id:callView

      //Attributes
      objectName:  "callView"
      anchors.top: tabView.bottom
      height:      parent.height - tabView.height
      width:       parent.width
   }

   HistoryView {
      id:historyView

      //Attributes
      objectName:  "historyView"
      anchors.top: tabView.bottom
      height:      parent.height - tabView.height
      width:       parent.width
      visible:     false
   }

   ListView {
      id:contactView

      //Attributes
      objectName:  "contactView"
      anchors.top: tabView.bottom
      height:      parent.height - tabView.height
      width:       parent.width
      visible:     false
   }

   SettingView {
      id:settingView

      //Attributes
      objectName:  "settingView"
      anchors.top: tabView.bottom
      height:      parent.height - tabView.height
      width:       parent.width
      visible:     false
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
