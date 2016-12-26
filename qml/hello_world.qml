/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    initialPage: initialPage //Component { FirstPage { } }
    cover: cover
    Page {
        id: initialPage
        Label {
            id: helloLabel
            text: "Привет, Хабр!"
            anchors.centerIn: parent
//            color: rgba("red", 0.1)
        }
        Button {
            id: btn
            text: "Диалоговое окно"
            anchors.top: helloLabel.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.push(dialog,
                                      {},
                                      PageStackAction.Immediate) // Переход без анимации. По умолчанию с анимацией.
            //onClicked: console.log(qsTr("btn Clicked"))
        }
        Text {
            id: headerText
            text: "Заголовок"
            font.family: Theme.fontFamilyHeading
            font.pixelSize: Theme.fontSizeLarge
        }
        Text {
            id: extraLarge
            text: "Чуть меньший размер шрифта"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeExtraLarge
            anchors.top: headerText.bottom
        }
        Text {
            id: largeText
            text: "Обычный большой размер"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeLarge
            color: "white"
            anchors.top: extraLarge.bottom
        }
        Text {
            id: mediumText
            text: "Обычный текст"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeMedium
            color: "white"
            anchors.top: largeText.bottom
        }
        Text {
            id: smalSize
            text: "Мелкий размер текст"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeSmall
            color: "white"
            anchors.top: mediumText.bottom
        }
        Text {
            id: extraSmall
            text: "Еще меньше"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeExtraSmall
            color: "white"
            anchors.top: smalSize.bottom
        }
        Text {
            id: tinySize
            text: "Самый маленький текст"
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeTiny
            color: "white"
            anchors.top: extraSmall.bottom
        }
        Label {
            text: Theme.highlightText("раз два три раз два три", "два", "red")
//            anchors.top: tinySize.bottom
//            anchors.centerIn: parent
            anchors.bottom: helloLabel.top
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }
    Cover {
        id: cover
        transparent: true
        Label {
            id: coverLabel
            text: "Привет, Хабр!"
            anchors.centerIn: parent
        }
    }

    Dialog {
        id: dialog
        DialogHeader {
            title: "Простой диалог"
        }

        Label {
            text: "Я - диалог"
            anchors.centerIn: parent
        }
        onAccepted: coverLabel.text = "Согласился"
        onRejected: coverLabel.text = "Отказался"
    }

//    cover: Qt.resolvedUrl("cover/CoverPage.qml")
//    allowedOrientations: defaultAllowedOrientations



}

