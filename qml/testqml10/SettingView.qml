import QtQuick 1.1

Rectangle {
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
                  settingView.state = "Accounts"
                  settingView.delegate = null
                  settingView.model = HistoryModel
                  settingView.delegate = accountDelegate
               }
            }
         }
      }
   }

   ListModel {
      id: settingCategories
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
   
   ListView {
      id:settingView
      model: settingCategories
      anchors.top: parent.top
      width:parent.width
      height:parent.height
      delegate: settingDelegate
      states: [
         State {
            name: "Default"
         },
         State {
            name: "Accounts"
         }
      ]
   }
}