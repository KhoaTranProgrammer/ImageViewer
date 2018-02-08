import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: -1

    Rectangle {
        anchors.fill: root
        color: "transparent"
    }

    ListModel {
        id: id_indexlist
    }

    Component {
        id: id_component

        Item {
            property int updateIndex: root.newIndex
            width: root.height
            height: root.height

            Rectangle {
                id: id_index
                anchors.fill: parent
                anchors.margins: 2
                radius: root.height / 2
                property int mIndex: INDEX
                color: "blue"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        root.newIndex = id_index.mIndex
                        root.indexChanged()
                    }
                }
            }
            onUpdateIndexChanged: {
                if(id_index.mIndex == root.newIndex){
                    id_index.color = "red"
                }else{
                    id_index.color = "blue"
                }
            }
        }
    }

    Flickable {
        anchors{
            top: root.top
            bottom: root.bottom
            horizontalCenter: root.horizontalCenter
        }
        width: root.height * id_indexlist.count

        Row {
            id: layout
            anchors.fill: parent
            Repeater {
                model: id_indexlist
                delegate: id_component
            }
        }
    }

    function addItem(index) {
        id_indexlist.append({"INDEX": index})
    }

    function next() {
        root.newIndex = (root.newIndex + 1) % id_indexlist.count
        root.indexChanged()
    }

    function previous() {
        if(root.newIndex == 0){
            root.newIndex = id_indexlist.count -1
        }else{
            root.newIndex = root.newIndex - 1
        }
        root.indexChanged()
    }
}
