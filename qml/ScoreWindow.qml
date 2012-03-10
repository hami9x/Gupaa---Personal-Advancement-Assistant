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
        Text {
            id: title
            text: qsTr("Your score today is...")
            anchors.top: parent.top
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 27
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

            SequentialAnimation {
                id: animation
                running: true
                loops: totalScoreText.totalScore
                PauseAnimation { duration: 150 }
                ScriptAction {
                    script: totalScoreText.current++;
                }
            }
        }
    }
}
