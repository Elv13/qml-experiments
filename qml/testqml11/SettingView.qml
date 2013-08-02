import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    Rectangle {
       id:settingView
       //color:Theme.palette.normal.base



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
                    console.log("ici :"+AccountListModel.size())
                   if (name == "Accounts") {
                       mainPageStack.push(accountPage)
                      //settingView.state = "Accounts"
                      accountListView.model = AccountListModel
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

       /*PageStack {
           id:settingPageStack
           width:parent.width
           height:parent.height
           anchors.top: parent.top
           Component.onCompleted: push(settingPage)*/
           Page {
               title:"Test"
               id:accountDetailPage
               visible:false
               AccountSettings {
                   id:accountSettings
               }
           }
           Page {
               title:"Settings"
               id:settingPage
               visible:false
               ListView {
                  id:settingViewList
                  model: settingCategoriesModel
                  anchors.top: parent.top
                  width:parent.width
                  height:parent.height
                  delegate: settingDelegate
               }
           }

           /*Page {
               title:"Account"
               id:accountPage
               visible:false
               ListView {
                   id:accountListView
                   anchors.top: parent.top
                   width:parent.width
                   height:parent.height
                   delegate: accountDelegate
               }
           }*/
       //}

       /*states: [
          State {
             name: "Default"
             PropertyChanges {target: settingViewList  ; visible: true  }
             PropertyChanges {target: accountSettings  ; visible: false }
             PropertyChanges {target: accountListView  ; visible: false }
          },
          State {
             name: "Accounts"
             PropertyChanges {target: settingViewList  ; visible: false }
             PropertyChanges {target: accountSettings  ; visible: false }
             PropertyChanges {target: accountListView  ; visible: true  }
          },
          State {
             name: "AccountDetails"
             PropertyChanges {target: settingViewList  ; visible: false }
             PropertyChanges {target: accountSettings  ; visible: true  }
             PropertyChanges {target: accountListView  ; visible: false }
          }
       ]*/
    }
}
