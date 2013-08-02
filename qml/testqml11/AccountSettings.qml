import QtQuick 2.0
import SFLPhone 1.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Page {
    id:accountSetting
    property Account account
    Flickable {
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: content.height
        Column {
        id:content
        width:parent.width

        ListItem.Header { text: "Basic" }
        ListItem.Standard {
            id: aliasLabel
            text: i18n.tr("Alias")
            control: TextField {
                id: aliasValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Label {
            id:protocolLabel
            text:"Protocol"
            //color:Theme.palette.normal.text
        }

        ListItem.ValueSelector {
            id:protocolValue
            text: "Protocol"
            values: ["SIP", "IAX"]
        }
        ListItem.Standard {
            id:serverLabel
            text:"Server"
            control: TextField {
                id:serverValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ListItem.Standard {
            id:usernameLabel
            text:"Username"
            control: TextField {
                id:usernameValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ListItem.Standard {
            id:passwordLabel
            text:"Password"
            control: TextField {
                id:passwordValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ListItem.Standard {
            id:voicemailLabel
            text:"Voicemail"
            control: TextField {
                id:voicemailValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        ListItem.Standard {
            id:contactAccountLabel
            text: i18n.tr("Default account for contacts")
            control: CheckBox {
                id: contactAccountValue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

         ListItem.Divider {  }
         ListItem.Header { text: "Advanced" }
         ListItem.Standard {
             id:expireLabel
             text:"Registration expire:"
             control: TextField {
                 id:expireValue
                 inputMethodHints : Qt.ImhFormattedNumbersOnly
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "accountRegistrationExpire"; value: expireValue.text }

         ListItem.Standard {
             id:localLabel
             text:"Inerface"
             control: TextField {
                 id:localValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "localInterface"; value: localValue.text }

         ListItem.Standard {
             id:portLabel
             text:"Port"
             control: TextField {
                 id:portValue
                 inputMethodHints : Qt.ImhFormattedNumbersOnly
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "localPort"; value: portValue.text }

         ListItem.Standard {
             id:proxyLabel
             text:"Proxy"
             control: TextField {
                 id:proxyValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "proxy"; value: proxyValue.text }

         ListItem.Standard {
             id:sameAsLocalLabel
             text:"Use same as local:"
             control: CheckBox {
                 id: sameAsLocalValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "publishedSameAsLocal"; value: sameAsLocalValue.checked }

         ListItem.Standard {
             id:publishedAddrLabel
             text:"Published address:"
             control: TextField {
                 id:publishedAddrValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "publishedAddress"; value: publishedAddrValue.text }

         ListItem.Standard {
             id:publishedPortLabel
             text:"Published port"
             control: TextField {
                 id:publishedPortValue
                 inputMethodHints : Qt.ImhFormattedNumbersOnly
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "publishedPort"; value: publishedPortValue.text }

         ListItem.Standard {
             id:hasStunLabel
             text:"Has STUN"
             control: CheckBox {
                 id: hasStunValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "sipStunEnabled"; value: hasStunValue.checked }

         ListItem.Standard {
             id:stunLabel
             text:"STUN Server"
             control: TextField {
                 id:stunValue
                 anchors.verticalCenter: parent.verticalCenter
             }
         }
         Binding { target: account; property: "sipStunServer"; value: stunValue.text }

         Label {
             id:overRtpLabel
             text:"DTMF over RTP"
         }
         ListItem.ValueSelector {
             text: "Standard"
             id:overRtpValue
             values: ["SIP", "RTP"]
         }
         Binding { target: account; property: "dTMFType"; value: overRtpValue.text }

         ListItem.Divider {  }

             ListItem.Header { text: "Codecs" }

             Rectangle {
                 id:codecSettings
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
             ListItem.Divider {  }
             ListItem.Header { text: "Security (TLS)" }
             //TLS enabled field
             ListItem.Standard {
                 id: enableTlsLabel
                 text:"Enable TLS"
                 control: CheckBox {
                     id: enableTlsValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsEnable"; value: enableTlsValue.checked }

             //Global TLS listener
             ListItem.Standard {
                 id: globalTlsLestenerLabel
                 text:"Global TLS listener"
                 control: TextField {
                     id: globalTlsListenerValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsListenerPort"; value: globalTlsListenerValue.text }

             //Authority certificate list
             ListItem.Standard {
                 id: authorotyCertListLabel
                 text:"Authority certificate list"
                 control: TextField {
                     id: authorotyCertListValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsCaListFile"; value: authorotyCertListValue.text }

            //Public End Point Certificate
             ListItem.Standard {
                 id: publicEndPointCertLabel
                 text:"Public End Point Certificate"
                 control: TextField {
                     id: publicEndPointCertValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsCertificateFile"; value: publicEndPointCertValue.text }

            //Private Key
             ListItem.Standard {
                 id: privateKeyLabel
                 text: "Private Key"
                 control: TextField {
                     id: privateKeyValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsPrivateKeyFile"; value: privateKeyValue.text }

            //Private Ket password
             ListItem.Standard {
                 id: privateKeyPassLabel
                 text: "Private Ket password"
                 control: TextField {
                     id: privateKeyPassValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsPassword"; value: privateKeyPassValue.text }

            //TLS Protocol Method
             ListItem.Standard {
                 id: tlsProtoMethodLabel
                 text: "TLS Protocol Method"
                 control: TextField {
                     id: tlsProtoMethodValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsMethod"; value: tlsProtoMethodValue.text }

            //TLS cipher list
             ListItem.Standard {
                 id: tlsCipherListLabel
                 text: "TLS cipher list"
                 control: TextField {
                     id: tlsCipherListValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsCiphers"; value: tlsCipherListValue.text }

            //Outgoing TLS server
             ListItem.Standard {
                 id: outgoingTlsServerLabel
                 text: "Outgoing TLS server"
                 control: TextField {
                     id: outgoingTlsServerValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsServerName"; value: outgoingTlsServerValue.text }

            //Negotiation Timeout (seconds)
             ListItem.Standard {
                 id: negoTimeOutSecLabel
                 text: "Negotiation Timeout (seconds)"
                 control: TextField {
                     id: negoTimeOutSecValue
                     inputMethodHints : Qt.ImhFormattedNumbersOnly
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsNegotiationTimeoutSec"; value: negoTimeOutSecValue.text }

            //Negotiation Timeout (milliseconds)
             ListItem.Standard {
                 id: negoTimeOutMSecLabel
                 text: "Negotiation Timeout (milliseconds)"
                 control: TextField {
                     id: negoTimeOutMSecValue
                     inputMethodHints : Qt.ImhFormattedNumbersOnly
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsNegotiationTimeoutMsec"; value: negoTimeOutMSecValue.text }

            //Verify incoming certificates
             ListItem.Standard {
                 id: verifyIncomingCertLabel
                 text: "Verify incoming certificates"
                 control: CheckBox {
                     id: verifyIncomingCertValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsVerifyServer"; value: verifyIncomingCertValue.checked }

            //Verify answer certificates
             ListItem.Standard {
                 id: verifyAnswerCertLabel
                 text: "Verify answer certificates"
                 control: CheckBox {
                     id: verifyAnswerCertValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsVerifyClient"; value: verifyAnswerCertValue.checked }

            //Require certificates for incoming calls
             ListItem.Standard {
                 id: requireCertForIncomingLabel
                 text: "Require certificates for incoming calls"
                 control: CheckBox {
                     id: requireCertForIncomingValue
                     anchors.verticalCenter: parent.verticalCenter
                 }
             }
             Binding { target: account; property: "tlsRequireClientCertificate"; value: requireCertForIncomingValue.text }


         }
     }

    onAccountChanged: {
        console.log("Account now is "+account.alias+" "+account.audioCodecModel())

        //Basic
        aliasValue.text                 = account.alias
        protocolValue.text              = account.typeName
        serverValue.text                = account.hostname
        usernameValue.text              = account.username
        //passwordValue.text            = account.
        voicemailValue.text             = account.mailbox
        contactAccountValue.checked     = false

        //Advanced
        expireValue.text                = account.accountRegistrationExpire
        localValue.text                 = account.localInterface
        portValue.text                  = account.localPort
        proxyValue.text                 = account.proxy
        sameAsLocalValue.checked        = account.publishedSameAsLocal
        publishedAddrValue.text         = account.publishedAddress
        publishedPortValue.text         = account.publishedPort
        hasStunValue.checked            = account.sipStunEnabled
        stunValue.text                  = account.sipStunServer
        //overRtpValue.checked          = account.dTMFType

        //Security
        enableTlsValue.checked           = account.tlsEnable
        globalTlsListenerValue.text      = account.tlsListenerPort
        authorotyCertListValue.text      = account.tlsCaListFile
        publicEndPointCertValue.text     = account.tlsCertificateFile
        privateKeyValue.text             = account.tlsPrivateKeyFile
        privateKeyPassValue.text         = account.tlsPassword
        tlsProtoMethodValue.text         = account.tlsMethod
        tlsCipherListValue.text          = account.tlsCiphers
        outgoingTlsServerValue.text      = account.tlsServerName
        negoTimeOutSecValue.text         = account.tlsNegotiationTimeoutSec
        negoTimeOutMSecValue.text        = account.tlsNegotiationTimeoutMsec
        verifyIncomingCertValue.checked  = account.tlsVerifyServer
        verifyAnswerCertValue.checked    = account.tlsVerifyClient
        requireCertForIncomingValue.text = account.tlsRequireClientCertificate

        //Codec
        audioCodecModelView.model = account.audioCodecModel()
        videoCodecModelView.model = account.videoCodecModel()

        accountSetting.title = account.alias
    }
}
