// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 500
    height: 300

    Item {
        id: textContainer
        anchors.margins: 20
        anchors.fill: parent

        Text {
            id: intro
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Gupaa is a software to help you manage yourself.\n")
            wrapMode: Text.WordWrap
        }

        Text {
            id: author
            anchors.top: intro.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            text: qsTr("Author: Nguyễn Thành Hải\n")
        }

        Text {
            id: license
            anchors.top: author.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            wrapMode: Text.WordWrap
            text: qsTr("This program is free software: you can redistribute it and/or modify \
it under the terms of the GNU General Public License as published by \
the Free Software Foundation.\n\
\n") + qsTr("We encourage you to join and help develop Gupaa, since it is an open source project.")
        }
    }
}
