// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 500
    height: 300

    Column {
        id: textContainer
        anchors.margins: 20
        anchors.fill: parent
        Text {
            id: intro
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Gupaa is a software to help you manage yourself.\n")
        }

        Text {
            id: author
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Author: Nguyễn Thành Hải\n")
        }

        Text {
            id: license
            width: parent.width
            wrapMode: Text.WordWrap
            text: qsTr("This program is free software: you can redistribute it and/or modify \
it under the terms of the GNU General Public License as published by \
the Free Software Foundation.\n\
\n\
We encourage you to join and help develop Gupaa, since it is an open source project.")
        }
    }
}
