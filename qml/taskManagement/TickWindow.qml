import QtQuick 1.1
import "../lib"

Rectangle {
    id: tListContainer;
    width: 500
    height: 500

    Component {
        id: tListDelegate
        Item {
            id: itemContainer
            anchors.left: parent.left
            anchors.right: parent.right
            height: 55

            Item {
                id: nameContainer
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: cbContainer.left
                anchors.left: parent.left
                anchors.margins: 20

                Text {
                    text: name
                    anchors.left: parent.left
                    anchors.right: parent.right
                    wrapMode: Text.WordWrap
                }
            }

            Item {
                id: cbContainer
                anchors.verticalCenter: parent.verticalCenter
                width: childrenRect.width
                height: childrenRect.height
                anchors.margins: 20
                anchors.right: parent.right
                CheckBox {
                    id: checkBox
                    state: tModel.get(index).done == 1 ? "checked" : ""

                    onStateChanged: {
                        var theState = checkBox.state == "" ? 0 : 1;
                        tModel.setProperty(index, "done", theState);
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

        Text {
            id: nothingMsg
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 20
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("There's no item here yet. You could use the 'Manage...' window to add.")
            visible: false
            wrapMode: Text.WordWrap
        }

        model: TickModel {
            id: tModel
            msgObj: nothingMsg
        }

        delegate: tListDelegate
    }

    Row {
        id: btnsContainer
        spacing: 10
        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        TextButton {
            text: qsTr("Save")
            onClicked: tListView.model.save()
        }
    }
}
