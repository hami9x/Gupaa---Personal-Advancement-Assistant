import QtQuick 1.1

//Provide this item a list of elements as its childen. It will show one element each time (and hide others)
Item {
    id: stackedContainer

    property int current: 0
    property int length: children.length

    Component.onCompleted: {
        for (var i=1; i<length; i++) {
            children[i].visible = false;
        }
    }

    function next() {
        children[current].visible = false;
        if (current>length-1) current=0;
        else current++;
        children[current].visible = true;
    }
}
