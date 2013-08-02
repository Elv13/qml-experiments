import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Page {
    title:"Account"
    id:accountPage
    Rectangle {
        anchors.fill: parent
        color:Theme.palette.normal.base
        Component {
           id: accountDelegate
           Item {
              width: parent.parent.width
              height: 40
              ListItem.Standard {
                  id:usernameLabel
                  text:display
              }
              MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     console.log("ici2 "+model.alias+" "+model.object+" "+AccountListModel.getAccountById(model.id))
                     mainPageStack.push(accountSettingsPage)
                     accountSettingsPage.account = AccountListModel.getAccountById(model.id)
                 }
              }
           }
        }
        ListView {
            id:accountListView
            anchors.top: parent.top
            width:parent.width
            height:parent.height
            delegate: accountDelegate
            model:AccountListModel
        }
    }
}
