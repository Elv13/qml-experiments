/******************************************************************************
 *   Copyright (C) 2012 by Savoir-Faire Linux                                 *
 *   Author : Emmanuel Lepage Vallee <emmanuel.lepage@savoirfairelinux.com>   *
 *                                                                            *
 *   This library is free software; you can redistribute it and/or            *
 *   modify it under the terms of the GNU Lesser General Public               *
 *   License as published by the Free Software Foundation; either             *
 *   version 2.1 of the License, or (at your option) any later version.       *
 *                                                                            *
 *   This library is distributed in the hope that it will be useful,          *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        *
 *   Lesser General Public License for more details.                          *
 *                                                                            *
 *   You should have received a copy of the Lesser GNU General Public License *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.    *
 *****************************************************************************/
import QtQuick 2.0
import Ubuntu.Components 0.1

Rectangle {
    id:dialPad
    color:"transparent"
    Rectangle {
        anchors.margins: 5

       //Attributes
       anchors.fill: parent
       color:"transparent"

       //Signals
       signal numbrePressed(string number)

       //Content
       Grid {
          columns: 3
          spacing: 3
          width:   parent.width
          height:  height/4*4
          Repeater {
             model: 12
             Rectangle {
                //Attributes
                width:  (parent.width-3.333)/3 -1
                height: dialPad.height/4 - 2
                color:  "transparent"
                radius: 5
                border.color: "#aa44aa"
                border.width: 2

                //Content
                Item {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter:   parent.verticalCenter
                    height: label.height + ascii.height
                    Text {

                        //Helpers
                        function getNumber(idx) {
                           var nb = new Array("1","2","3","4","5","6","7","8","9","*","0","#")
                           return nb[idx]
                        }
                        anchors.horizontalCenter: parent.horizontalCenter
                       horizontalAlignment:      Text.AlignRight
                       text:                     getNumber(index)
                       color:"white"
                       font.bold: true
                       id:label
                    } //Text
                    Text {
                        text: Array("","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz","","+","","")[index]
                        anchors.top:label.bottom
                        color:"white"
                        horizontalAlignment:      Text.AlignRight
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: ascii
                    }
                }

                MouseArea {
                   anchors.fill: parent
                   onClicked: console.log("button clicked "+index)
                } //MouseArea
             } //Rectangle
          } //Repeater
       } //Grid
    }
}
