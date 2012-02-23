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
                anchors.margins: 10
                Text {
                    text: name
               }
            }
            Item {
                id: toolboxContainer
                anchors.right: parent.right
                anchors.margins: 10
                width: 70
                Text {
                    anchors.right: parent.right
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
