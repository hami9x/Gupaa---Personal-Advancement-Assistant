import QtQuick 1.1
import "./taskManagement"

Rectangle {
    id: scoreWindow
    width: 500
    height: 500

    TickModel {
        id: model
    }

    Column {
        spacing: 30
        anchors.fill: parent
        anchors.margins: 20
        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: childrenRect.height
            Text {
                id: title
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Your score today is...")
                font.pixelSize: 27
            }
        }

        Text {
            id: totalScoreText
            property int current: 0
            property int totalScore: model.getTotalScore()
            text: current
            anchors.margins: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pixelSize: 59

            NumberAnimation on current {
                to: totalScoreText.totalScore
                duration: 2000
            }
        }
    }
}
