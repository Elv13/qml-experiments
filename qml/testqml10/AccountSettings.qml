import QtQuick 1.1
Flickable {
    property Account account
    anchors.fill: parent
    contentWidth: parent.width; contentHeight: content.height
    Column {
     id:content
     width:parent.width

     Text {
         id: basicHeader
         text: "Basic"
         font.bold: true
     }

     Rectangle {
         id:basicSettings
        anchors.top: basicHeader.bottom
        color:"#dddd22"
        height:200
        width:parent.width
        Text {
            id: aliasLabel
            text:"Alias"
        }
        Text {
            id: aliasValue
            anchors.top: aliasLabel.bottom
        }
        Text {
            id:protocolLabel
            text:"Protocol"
            anchors.top: aliasValue.bottom
        }
        Text {
            id:protocolValue
            anchors.top: protocolLabel.bottom
        }
        Text {
            id:serverLabel
            text:"Server"
            anchors.top: protocolValue.bottom
        }
        Text {
            id:serverValue
            anchors.top: serverLabel.bottom
        }
        Text {
            id:usernameLabel
            text:"Username"
            anchors.top: serverValue.bottom
        }
        Text {
            id:usernameValue
            anchors.top: usernameLabel.bottom
        }
        Text {
            id:passwordLabel
            text:"Password"
            anchors.top: usernameValue.bottom
        }
        Text {
            id:passwordValue
            anchors.top: passwordLabel.bottom
        }
        Text {
            id:voicemailLabel
            text:"Voicemail"
            anchors.top: passwordLabel.bottom
        }
        Text {
            id:voicemailValue
            anchors.top: voicemailLabel.bottom
        }
        Text {
            id:contactAccountLabel
            text:"Default account for contacts"
            anchors.top: voicemailValue.bottom
        }
        Text {
            id:contactAccountValue
            anchors.top: contactAccountLabel.bottom
        }
     }

     Text {
         id: advancedHeader
         anchors.top: basicSettings.bottom
         text: "Advanced"
         font.bold: true
     }
     Rectangle {
         id:advancedSettings
         anchors.top: advancedHeader.bottom
         color:"#dddd22"
         height:200
         width:parent.width
     }



         Text {
             id: codecHeader
             anchors.top: advancedSettings.bottom
             text: "Codecs"
             font.bold: true
         }

         Rectangle {
             id:codecSettings
             anchors.top: codecHeader.bottom
             color:"#dddd22"
             width:parent.width
             height: codecSettingsCols.height

             Component {
                 id:audioCodecDelegate
                 Rectangle {
                     height:20
                     width:codecSettings.width
                     //anchors.fill: parent
                     Row {
                         spacing: 5
                            Text {
                                text:model.name
                            }
                            Text {
                                text:model.bitrate
                            }
                            Text {
                                text:model.samplerate
                            }
                     }
                 }
             }

             Component {
                 id:videoCodecDelegate
                 Rectangle {
                     Row {
                         spacing: 5
                            Text {
                                text:"sdfsdf"
                            }
                            Text {
                                text:"234"
                            }
                     }
                 }
             }
             Column {
                 id:codecSettingsCols
                 Text {
                     text:"Audio codecs:"
                 }
                 Repeater {
                     id:audioCodecModelView
                     delegate:audioCodecDelegate
                     width:parent.width
                 }
                 Text {
                     text:"Video codecs:"
                 }
                 Repeater {
                     id:videoCodecModelView
                     delegate:videoCodecDelegate
                     width:parent.width
                 }
             }
         }
     }

    onAccountChanged: {
        console.log("Account now is "+account.alias+" "+account.videoCodecModel())
        aliasValue.text          = account.alias
        protocolValue.text       = account.typeName
        serverValue.text         = account.hostname
        usernameValue.text       = account.username
        //passwordValue.text       = account.
        voicemailValue.text      = account.mailbox
        contactAccountValue.text = "false"

        //Codec
        audioCodecModelView.model = account.audioCodecModel()
        videoCodecModelView.model = account.videoCodecModel()
    }
 }
