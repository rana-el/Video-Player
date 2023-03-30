import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

Rectangle {
    width: 640
    height: 480
    color: "black"


    Video {
        id: videoplayer
        source: ""
        anchors.fill: parent
    }

    Row {
        Button {
            text: "Play"
            onClicked: video.play()
        }

        Button {
            text: "Pause"
            onClicked: video.pause()
        }

        Slider {
            id: slider
            from: 0
            to: videoplayer.duration
            value: videoplayer.position
            onValueChanged: videoplayer.position = value
        }
    }

    FileDialog {
        id: fileDialog
        title: "Open the Video"
        nameFilters: ["Video file (*.mp4 *.avi *.mov)"]
        onAccepted: videoplayer.source = fileDialog.fileUrl
    }

    MouseArea {
        anchors.fill: parent
        onClicked: fileDialog.open()
    }
}
