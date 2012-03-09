import QtQuick 1.1

Rectangle {
    id: container
    width: 500
    height: 500

    TaskList {
        id: theTaskList
        anchors.fill: parent
        anchors.margins: 20
        anchors.horizontalCenter: container.horizontalCenter
    }
}
