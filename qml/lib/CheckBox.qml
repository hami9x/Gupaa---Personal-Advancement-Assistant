import QtQuick 1.1

Image {
    id: checkBox
    source: "image://qrc/pics/checkbox_unchecked.png"

    MouseArea {
        anchors.fill: parent
        onClicked: checkBox.state == "checked" ? checkBox.state = "" : checkBox.state = "checked"
    }

    states: [
        State {
            name: "checked"
            PropertyChanges {
                target: checkBox
                source: "image://qrc/pics/checkbox_checked.png"
            }
        }
    ]
}
