import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    x: 150; y: 150
    width: 350; height: 350
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint
    color: 'lemonchiffon'






    Rectangle {
        id: inputRect
        x: 20; y: 20
        width: numbers.width
        height: 25

        border.width: 2
        border.color: 'gray'

        Text {
            id: input
            //anchors.centerIn: parent
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            font.family: 'Helvetica'
            font.pixelSize: inputRect.height - 3
            text: '22 + 14'
        }
    }

    Grid {
        id: numbers

        anchors.top: inputRect.bottom
        anchors.topMargin: 10
        anchors.left: inputRect.left

        rows: 3; columns: 3
        spacing: 5

        Repeater {
            model: 9
            SquareButton {
                size: 50
                color: "lightblue"
                text: index + 1

                onClicked: {

                    input.text += text
                }
            }
        }
    }

    Row {
        id: additionalNumbers

        anchors.top: numbers.bottom
        anchors.topMargin: 10
        anchors.left: numbers.left

        spacing: 5

        SquareButton {
            size: 50
            text: '0'
        }
        SquareButton {
            size: 50
            text: '.'
        }
        SquareButton {
            size: 50
            text: '='
        }
    }

    Column {
        id: operations

        anchors.left: numbers.right
        anchors.leftMargin: 10
        anchors.top: numbers.top

        spacing: 5

        SquareButton {
            id: plusButton
            text: '+'
            size: 50
        }
        SquareButton {
            id: minusButton
            text: '-'
            size: 50
        }
        SquareButton {
            id: multiplicationButton
            text: '*'
            size: 50
        }
        SquareButton {
            id: divisionButton
            text: '/'
            size: 50
        }

    }

    SquareButton {
        id: exit
        anchors.top : numbers.top
        size: 50
        x: parent.width - size - 5

        color: 'lightcoral'
        text: 'X'
        //textColor: 'white'

        onClicked: Qt.quit()
    }


}
