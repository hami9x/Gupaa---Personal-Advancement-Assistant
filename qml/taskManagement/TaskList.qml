import QtQuick 1.1

Rectangle {
    id: tListContainer;

    Component {
        id: tListDelegate
        Item {
            width: tListView.width; height: 55
            Item {
                id: nameContainer
                anchors.left: parent.left
                anchors.right: toolboxContainer.left
                anchors.verticalCenter: toolboxContainer.verticalCenter
                anchors.margins: 10
                Text {
                    text: name
               }
            }
            Row {
                id: toolboxContainer
                anchors.right: parent.right
                anchors.margins: 10
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                width: 70
                Image {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    source: "image://qrc/pics/edit.png"
                }

                Column {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    Image {
                        source: "image://qrc/pics/arrow-up.png"
                    }
                    Image {
                        source: "image://qrc/pics/arrow-down.png"
                    }
                }

                Text {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    text: point
                }
            }
        }
    }


    ListView {
        id: tListView
        anchors.fill: parent

        model: TaskListModel {}

        delegate: tListDelegate
    }

}
