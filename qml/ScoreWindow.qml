import QtQuick 1.1

Rectangle {
    id: scoreWindow
    width: 500
    height: 350

    ScoreModel {
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
                id: scoreAnim
                to: totalScoreText.totalScore
                duration: 2000

                onCompleted: {
                    percentContainer.show();
                    comment.visible = true;
                }
            }
        }

        Rectangle {
            id: percentContainer
            property int percent: 0
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            height: childrenRect.height
            width: childrenRect.width

            function show() {
                percent = Math.round(totalScoreText.totalScore / model.getFullScore() * 100);
                percentContainer.visible = true;
                model.clearTicks();
            }

            Text {
                id: thatMeans
                text: qsTr("That means: ")
            }

            Text {
                id: pValue
                text: percentContainer.percent + "%"
                anchors.left: thatMeans.right
                font.bold: true
                font.pixelSize: 20
            }
        }

        Text {
            id: comment
            visible: false
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            text: {
                var percent = percentContainer.percent
                if (percent <= 50)
                    return qsTr("It's terrible, please try your best next time.");
                else if (50 < percent && percent <= 70)
                    return qsTr("Still bad, you must try.");
                else if (70 < percent && percent <= 90)
                    return qsTr("Quite good, get 100% next time please!");
                else return qsTr("My dear, you are awesome! Keep up the good work.")
            }
        }
    }
}
