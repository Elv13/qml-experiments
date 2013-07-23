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
        color:"#dddd22"
        height:200
        width:parent.width
        Text {
            id: aliasLabel
            text:"Alias"
        }
        TextEdit {
            id: aliasValue
            anchors.top: aliasLabel.bottom
        }
        Text {
            id:protocolLabel
            text:"Protocol"
            anchors.top: aliasValue.bottom
        }
        TextEdit {
            id:protocolValue
            anchors.top: protocolLabel.bottom
        }
        Text {
            id:serverLabel
            text:"Server"
            anchors.top: protocolValue.bottom
        }
        TextEdit {
            id:serverValue
            anchors.top: serverLabel.bottom
        }
        Text {
            id:usernameLabel
            text:"Username"
            anchors.top: serverValue.bottom
        }
        TextEdit {
            id:usernameValue
            anchors.top: usernameLabel.bottom
        }
        Text {
            id:passwordLabel
            text:"Password"
            anchors.top: usernameValue.bottom
        }
        TextEdit {
            id:passwordValue
            anchors.top: passwordLabel.bottom
        }
        Text {
            id:voicemailLabel
            text:"Voicemail"
            anchors.top: passwordLabel.bottom
        }
        TextEdit {
            id:voicemailValue
            anchors.top: voicemailLabel.bottom
        }
        Text {
            id:contactAccountLabel
            text:"Default account for contacts"
            anchors.top: voicemailValue.bottom
        }
        TextEdit {
            id:contactAccountValue
            anchors.top: contactAccountLabel.bottom
        }
     }

     Text {
         id: advancedHeader
         text: "Advanced"
         font.bold: true
     }
     Rectangle {
         id:advancedSettings
         color:"#dddd22"
         height:advancedSettingsCols.height
         width:parent.width
         Column {
             id:advancedSettingsCols
             Text {
                 id:expireLabel
                 text:"Registration expire:"
             }
             TextEdit {
                 //width:parent.width; height:20
                 color:"midnightblue"
                 id:expireValue
             }
             Binding { target: account; property: "accountRegistrationExpire"; value: expireValue.text }

             Text {
                 id:localLabel
                 text:"Inerface"
             }
             TextEdit {
                 id:localValue
             }
             Binding { target: account; property: "localInterface"; value: localValue.text }

             Text {
                 id:portLabel
                 text:"Port"
             }
             TextEdit {
                 id:portValue
             }
             Binding { target: account; property: "localPort"; value: portValue.text }

             Text {
                 id:proxyLabel
                 text:"Proxy"
             }
             TextEdit {
                 id:proxyValue
             }
             Binding { target: account; property: "proxy"; value: proxyValue.text }

             Text {
                 id:sameAsLocalLabel
                 text:"Use same as local:"
             }
             TextEdit {
                 id:sameAsLocalValue
             }
             Binding { target: account; property: "publishedSameAsLocal"; value: sameAsLocalValue.text }

             Text {
                 id:publishedAddrLabel
                 text:"Published address:"
             }
             TextEdit {
                 id:publishedAddrValue
             }
             Binding { target: account; property: "publishedAddress"; value: publishedAddrValue.text }

             Text {
                 id:publishedPortLabel
                 text:"Published port"
             }
             TextEdit {
                 id:publishedPortValue
             }
             Binding { target: account; property: "publishedPort"; value: publishedPortValue.text }

             Text {
                 id:hasStunLabel
                 text:"Has STUN"
             }
             TextEdit {
                 id:hasStunValue
             }
             Binding { target: account; property: "sipStunEnabled"; value: hasStunValue.text }

             Text {
                 id:stunLabel
                 text:"STUN Server"
             }
             TextEdit {
                 id:stunValue
             }
             Binding { target: account; property: "sipStunServer"; value: stunValue.text }

             Text {
                 id:overRtpLabel
                 text:"DTMF over RTP"
             }
             TextEdit {
                 id:overRtpValue
             }
             Binding { target: account; property: "dTMFType"; value: overRtpValue.text }

         }
     }



         Text {
             id: codecHeader
             text: "Codecs"
             font.bold: true
         }

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
         Text {
             id: securityHeader
             text: "Security (TLS)"
             font.bold: true
         }
         Rectangle {
             id:securitySettings
             anchors.top: securityHeader.bottom
             color:"#dddd22"
             width:parent.width
             height:400
             Column {
                 Text {
                     id: enableTlsLabel
                     text:"Enable TLS"
                 }
                 TextEdit {
                     id: enableTlsValue
                 }
                 Binding { target: account; property: "tlsEnable"; value: enableTlsValue.text }

                 Text {
                     id: globalTlsLestenerLabel
                     text:"Global TLS listener"
                 }
                 TextEdit {
                     id: globalTlsListenerValue
                 }
                 Binding { target: account; property: "tlsListenerPort"; value: globalTlsListenerValue.text }

                 Text {
                     id: authorotyCertListLabel
                     text:"Authority certificate list"
                 }
                 TextEdit {
                     id: authorotyCertListValue
                 }
                 Binding { target: account; property: "tlsCaListFile"; value: authorotyCertListValue.text }


                 Text {
                     id: publicEndPointCertLabel
                     text:"Public End Point Certificate"
                 }
                 TextEdit {
                     id: publicEndPointCertValue
                 }
                 Binding { target: account; property: "tlsCertificateFile"; value: publicEndPointCertValue.text }


                 Text {
                     id: privateKeyLabel
                     text: "Private Key"
                 }
                 TextEdit {
                     id: privateKeyValue
                 }
                 Binding { target: account; property: "tlsPrivateKeyFile"; value: privateKeyValue.text }


                 Text {
                     id: privateKeyPassLabel
                     text: "Private Ket password"
                 }
                 TextEdit {
                     id: privateKeyPassValue
                 }
                 Binding { target: account; property: "tlsPassword"; value: privateKeyPassValue.text }


                 Text {
                     id: tlsProtoMethodLabel
                     text: "TLS Protocol Method"
                 }
                 TextEdit {
                     id: tlsProtoMethodValue
                 }
                 Binding { target: account; property: "tlsMethod"; value: tlsProtoMethodValue.text }


                 Text {
                     id: tlsCipherListLabel
                     text: "TLS cipher list"
                 }
                 TextEdit {
                     id: tlsCipherListValue
                 }
                 Binding { target: account; property: "tlsCiphers"; value: tlsCipherListValue.text }


                 Text {
                     id: outgoingTlsServerLabel
                     text: "Outgoing TLS server"
                 }
                 TextEdit {
                     id: outgoingTlsServerValue
                 }
                 Binding { target: account; property: "tlsServerName"; value: outgoingTlsServerValue.text }


                 Text {
                     id: negoTimeOutSecLabel
                     text: "Negotiation Timeout (seconds)"
                 }
                 TextEdit {
                     id: negoTimeOutSecValue
                 }
                 Binding { target: account; property: "tlsNegotiationTimeoutSec"; value: negoTimeOutSecValue.text }


                 Text {
                     id: negoTimeOutMSecLabel
                     text: "Negotiation Timeout (milliseconds)"
                 }
                 TextEdit {
                     id: negoTimeOutMSecValue
                 }
                 Binding { target: account; property: "tlsNegotiationTimeoutMsec"; value: negoTimeOutMSecValue.text }


                 Text {
                     id: verifyIncomingCertLabel
                     text: "Verify incoming certificates"
                 }
                 TextEdit {
                     id: verifyIncomingCertValue
                 }
                 Binding { target: account; property: "tlsVerifyServer"; value: verifyIncomingCertValue.text }


                 Text {
                     id: verifyAnswerCertLabel
                     text: "Verify answer certificates"
                 }
                 TextEdit {
                     id: verifyAnswerCertValue
                 }
                 Binding { target: account; property: "tlsVerifyClient"; value: verifyAnswerCertValue.text }


                 Text {
                     id: requireCertForIncomingLabel
                     text: "Require certificates for incoming calls"
                 }
                 TextEdit {
                     id: requireCertForIncomingValue
                 }
                 Binding { target: account; property: "tlsRequireClientCertificate"; value: requireCertForIncomingValue.text }


             }
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
        contactAccountValue.text        = "false"

        //Advanced
        expireValue.text                = account.accountRegistrationExpire
        localValue.text                 = account.localInterface
        portValue.text                  = account.localPort
        proxyValue.text                 = account.proxy
        sameAsLocalValue.text           = account.publishedSameAsLocal
        publishedAddrValue.text         = account.publishedAddress
        publishedPortValue.text         = account.publishedPort
        hasStunValue.text               = account.sipStunEnabled
        stunValue.text                  = account.sipStunServer
        //overRtpValue.text = account.dTMFType

        //Security
        enableTlsValue.text              = account.tlsEnable
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
        verifyIncomingCertValue.text     = account.tlsVerifyServer
        verifyAnswerCertValue.text       = account.tlsVerifyClient
        requireCertForIncomingValue.text = account.tlsRequireClientCertificate

        //Codec
        audioCodecModelView.model = account.audioCodecModel()
        videoCodecModelView.model = account.videoCodecModel()
    }
 }
