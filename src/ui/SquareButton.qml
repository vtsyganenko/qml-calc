import QtQuick 2.0

// provides square button
Rectangle {

    property alias text: txt.text
    property alias textColor: txt.color

    signal clicked

    property int size: 40
    width: size; height: size



    property color unactiveColor: 'gray'        // mouse elsewhere
    property color activeColor: 'black'         // mouse over button
    property color triggeredColor: 'white'      // mouse press button

    border.color: unactiveColor
    border.width: 2

    Text {
        id: txt
        color: unactiveColor
        anchors.centerIn: parent
        font.family: 'Helvetica'
        font.pixelSize: 30
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onContainsMouseChanged: {
            border.color = containsMouse ? activeColor : unactiveColor
            txt.color = containsMouse ? activeColor : unactiveColor
        }
        onPressed: {
            border.color = triggeredColor
            txt.color = triggeredColor
        }
        onReleased: {
            border.color = activeColor
            txt.color = activeColor
        }
        onClicked: parent.clicked()
    }
}
