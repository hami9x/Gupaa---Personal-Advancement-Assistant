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

                        onTextChanged: {
                            tListModel.setProperty(index, "name", text);
                        }
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
                            var moveTo = index===0 ? tListModel.count-1 : index-1
                            tListModel.move(index, moveTo, 1)
                        }
                    }
                    PushButton {
                        source: "image://qrc/pics/arrow-down.png"
                        onClicked: {
                            var moveTo = index===tListModel.count-1 ? 0 : index+1;
                            tListModel.move(index, moveTo, 1)
                        }
                    }
                }

                SimpleTextEdit {
                    anchors.verticalCenter: toolboxContainer.verticalCenter
                    text: point

                    onTextChanged: {
                        tListModel.setProperty(index, "point", text);
                    }
                }
            }
        }
    }


    ListView {
        id: tListView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: btnsContainer.top

        function modelAddItem() {
            model.append({"name": qsTr("Here is some text that describes a task, click here to edit"), "point": 0});
        }

        function modelDel(i) {
            var id = tListModel.get(i).id;
            if (typeof id !== 'undefined') {
                delList.append({"id": id});
            }

            tListModel.remove(i);
        }

        function modelRemoveAll() {
            while (tListModel.count != 0) {
                modelDel(tListModel.count-1);
            }
        }

        function showNothingMessage() {
            nothingMsg.visible = true;
        }

        function hideNothingMessage() {
            nothingMsg.visible = false;
        }

        Text {
            id: nothingMsg
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("There's no item here yet. You could add new ones with the Add button below.")
            visible: false
            wrapMode: Text.WordWrap
        }

        ListModel {
            id: delList
        }

        model: TaskListModel {
            id: tListModel
            msgObj: nothingMsg
        }

        delegate: tListDelegate
    }


    Row {
        id: btnsContainer
        spacing: 10
        anchors.margins: 10
        anchors.bottom: parent.bottom

        TextButton {
            text: qsTr("Add new task")
            onClicked: tListView.modelAddItem()
        }
        TextButton {
            text: qsTr("Delete everything")
            onClicked: tListView.modelRemoveAll()
        }
        TextButton {
            text: qsTr("Save")
            onClicked: tListView.model.save(delList)

        }
    }
}
