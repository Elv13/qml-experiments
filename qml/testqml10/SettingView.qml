import QtQuick 1.1

Rectangle {
    id:settingView
   color: "green"
   
   Component {
      id: accountDelegate
      Item {
         width: parent.parent.width
         height: 40
         Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            radius: 5
            color: "red"
            anchors.verticalCenter: parent.verticalCenter
            Text {
               anchors.verticalCenter: parent.verticalCenter
               text: display
               color: "black"
               font.bold: true
            }
         }
         MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("ici2 "+model.alias+" "+model.object+" "+AccountListModel.getAccountById(model.id))
                settingView.state = "AccountDetails"
                accountSettings.account = AccountListModel.getAccountById(model.id)
            }
         }
      }
   }
   
   Component {
      id: settingDelegate
      Item {
         width: parent.parent.width
         height: 40
         Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            radius: 5
            color: "red"
            anchors.verticalCenter: parent.verticalCenter
            Text {
               anchors.verticalCenter: parent.verticalCenter
               text: name
               color: "black"
               font.bold: true
            }
         }
         
         MouseArea {
            anchors.fill: parent
            onClicked: {
               console.log("ici")
               if (name == "Accounts") {
                  settingViewList.state = "Accounts"
                  settingViewList.delegate = null
                  settingViewList.model = AccountListModel
                  settingViewList.delegate = accountDelegate
               }
            }
         }
      }
   }

   ListModel {
      id: settingCategoriesModel
      ListElement {
            name: "Accounts"
      }
      ListElement {
            name: "Audio"
      }
      ListElement {
            name: "Contacts"
      }
      ListElement {
            name: "Display"
      }
      ListElement {
            name: "History"
      }
   }

   AccountSettings {
       id:accountSettings
       visible:false
   }
   
   ListView {
      id:settingViewList
      model: settingCategoriesModel
      anchors.top: parent.top
      width:parent.width
      height:parent.height
      delegate: settingDelegate
   }
   states: [
      State {
         name: "Default"
         PropertyChanges {target: settingViewList; visible: true  }
         PropertyChanges {target: accountSettings  ; visible: false }
      },
      State {
         name: "Accounts"
         PropertyChanges {target: settingViewList; visible: true  }
         PropertyChanges {target: accountSettings  ; visible: false }
      },
      State {
           name: "AccountDetails"
           PropertyChanges {target: settingViewList; visible: false }
           PropertyChanges {target: accountSettings  ; visible: true  }
      }
   ]
}
