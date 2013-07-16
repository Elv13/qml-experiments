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
import QtQuick 1.1

Rectangle {
    id:dialPad
    height:200

    signal numbrePressed(string number)
    function getNumber(idx) {
        var nb = new Array("1","2","3","4","5","6","7","8","9","*","0","#")
        return nb[idx]
    }
    Grid {
        columns: 3
        spacing: 3
        width:parent.width
        height:50*4
        Repeater {
            model: 12
            Rectangle {
                width:parent.width/3 -1
                height:48
                color: "#cccccc"
                radius:5
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignRight
                    text:getNumber(index)+ "\n" + Array("","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz","","+","","")[index]
                }
                MouseArea {
                     anchors.fill: parent
                     onClicked: console.log("button clicked "+index)
                 }
                /*onClicked: {
                   playDMTF(index)
                   dialPad.numbrePressed(dialPad.getNumber(index))
                }*/
            }
        }
    }

    Component.onCompleted: {
       //dialPad.numbrePressed.connect(display.addText)
    }
}
