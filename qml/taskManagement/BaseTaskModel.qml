import QtQuick 1.1

ListModel {
    signal emptied
    signal unemptied

    property bool empty: count===0 ? true : false
    property variant msgObj: 0

    function getDb() {
        return openDatabaseSync("GupaaTL", 1.0, "The list of tasks in Gupaa", 100000);
    }

    /*function getNothingText() {
        var obj = Qt.createQmlObject('Text {id: nothingMsg;\
anchors.horizontalCenter=parent.horizontalCenter;\
text: ' + nothingMessage + "}");
    }*/

    /* This currently doesn't work due to a bug of QML, so I must use a workaround
    onEmptyChanged: {
        if (empty) emptied();
        else unemptied();
    }*/
    Component.onCompleted: {
        onEmptyChanged();
        if (msgObj != 0) emptyChanged.connect(onEmptyChanged);
    }

    function onEmptyChanged() {
        if (empty) {
            emptied();
            msgObj.visible = true;
        }
        else {
            unemptied();
            msgObj.visible = false;
        }
    }
}
