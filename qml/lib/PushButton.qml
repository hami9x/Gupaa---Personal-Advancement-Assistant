// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image {
    id: pushBtn

    MouseArea {
        anchors.fill: parent
        onPressed: pushBtn.scale = 0.9
        onReleased: pushBtn.scale = 1
    }
}
