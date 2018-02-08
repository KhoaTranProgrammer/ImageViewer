import QtQuick 2.3
import "data.js" as Data

Rectangle {
    id: root
    anchors.fill: parent

    Component.onCompleted: {
        for(var i=0; i<Data.imageList.length; i++){
            id_indexArea.addItem(i)
        }
        id_indexArea.next()
    }

    Timer {
        id: id_timer
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            id_indexArea.next()
        }
    }

    Image {
        id: id_background
        anchors.fill: parent
        cache: false
    }

    Image {
        id: id_previous
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        rotation: 180
        source: "image/arrow.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.previous()
            }
        }
    }

    Image {
        id: id_next
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        source: "image/arrow.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.next()
            }
        }
    }

    IndexArea {
        id: id_indexArea
        anchors {
            bottom: root.bottom
            left: root.left
            right: root.right
        }
        height: root.height / 10

        onIndexChanged: {
            id_background.source = "image/" + Data.imageList[id_indexArea.newIndex]
        }
    }
}
