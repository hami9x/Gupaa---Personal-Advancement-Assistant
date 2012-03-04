import QtQuick 1.1
import "../lib"

Rectangle {
    id: tListContainer;

    Component {
        id: tListDelegate
        Item {
            width: tListView.width; height: 55
            FocusScope {
                id: nameContainer
                anchors.margins: 10                
                anchors.left: parent.left
                anchors.right: toolboxContainer.left
                anchors.top: parent.top
                anchors.bottom:  parent.bottom

                Item {
                    id: inputContainer
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            input.forceActiveFocus();
                        }
                    }

                    SimpleTextEdit {
                        id: input
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.left: parent.left
                        text: name
                    }
                }
            }
            Row {
                id: toolboxContainer
                anchors.right: parent.right
                anchors.margins: 10
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                width: 70
                PushButton {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    source: "image://qrc/pics/edit.png"

                    onClicked: nameContainer.forceActiveFocus()
                }

                Column {
                    id: arrowsContainer
                    property int pointStep: 1

                    anchors.verticalCenter: toolboxContainer.verticalCenter

                    PushButton {
                        source: "image://qrc/pics/arrow-up.png"                        
                        onClicked: {
                            var moveTo = index==0 ? tListModel.count-1 : index-1
                            tListModel.move(index, moveTo, 1)
                        }
                    }
                    PushButton {
                        source: "image://qrc/pics/arrow-down.png"
                        onClicked: {
                            var moveTo = index==tListModel.count-1 ? 0 : index+1;
                            tListModel.move(index, moveTo, 1)
                        }
                    }
                }

                SimpleTextEdit {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    text: point
                }
            }
        }
    }


    ListView {
        id: tListView
        anchors.fill: parent

        model: TaskListModel {
            id: tListModel
        }

        delegate: tListDelegate
    }

}
