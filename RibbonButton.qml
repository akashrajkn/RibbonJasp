import QtQuick 2.0
import QtQuick.Controls 2.3


Rectangle {
    id: button
    width: (innerText.width > backgroundImage.width ? innerText.width : backgroundImage.width) + 20 // + 2*tbutton.width
    height: 60 // backgroundImage.height + innerText.height
    property alias text: innerText.text
    property alias source: backgroundImage.source
    // property alias menu: contextMenu

    signal clicked

    Image {
        width: 37
        height: 28
        id: backgroundImage

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        // anchors.bottom: innerText.top
        anchors.topMargin: 5
        // source: (button.enabled ? "qrc:/icons/analysis-bayesian-ttest.svg" : "qrc:/icons/analysis-bayesian-ttest.svg")
    }

    Text {
        id: innerText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: backgroundImage.bottom
        anchors.bottom: parent.bottom

        anchors.topMargin: 5

        // anchors.bottomMargin: 10
        // anchors.centerIn: parent
        color: "black"
        font.bold: false
    }

    MouseArea {
        id: mice
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            button.clicked();
            // contextMenu.popup();
            popup.open()
        }
        onPressed: {
            // backgroundImage.source = "qrc:/icons/analysis-bayesian-crosstabs.svg"
            button.color = Qt.tint("grey", "#f7f7f700") // use #f7f7f7f7
        }
        onReleased: {
            // backgroundImage.source = "qrc:/icons/analysis-bayesian-ttest.svg"
            button.color = "transparent"
        }
        onEntered: {
            // backgroundImage.source = "qrc:/icons/analysis-bayesian-ttest.svg"
            button.border.color = Qt.tint("grey", "#10FF0000")
            // button.color = "grey"
        }
        onExited: {
            button.border.color = "transparent";
            button.color = "transparent";
        }
    }


    Popup {
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape
        id: popup
        width: {
            var max_width = t1.width
            if (t2.width > max_width) {
                max_width = t2.width
            }

            if (t3.width > max_width) {
                max_width = t3.width
            }

            return max_width + 25

            //
            // var result = 0;
            // var padding = 0;
            // for (var i = 0; i < popupitems.count; ++i) {
            //     var item = popupitems.itemAt(i);
            //     result = Math.max(item.contentItem.implicitWidth, result);
            //     padding = Math.max(item.padding, padding);
            // }
            // return result + padding * 2;
        }
        height: (t1.implicitHeight + t2.implicitHeight + t3.implicitHeight) + 25
        modal: true
        focus: false

        y: mice.mouseY
        x: mice.mouseX

        Item {
            id: popupitems
            Button {
                id: t1
                text: "Bayesian Independent samples T-Test"
                onClicked: {
                    console.log("JASP -- clicked")
                    button.clicked()
                    popup.close()
                }
            }

            Button {
                id: t2
                anchors.top: t1.bottom
                text: "Bayesian Paired samples T-Test"
                onClicked: {
                    button.clicked()
                    popup.close()
                }
            }

            Button {
                id: t3
                anchors.top: t2.bottom
                text: "Bayesian One sample T-Test"
                onClicked: {
                    button.clicked()
                    popup.close()
                }
            }
        }

    }


    // AutoSizingMenu {
    //     id: contextMenu
    //
    //     MenuItem {
    //         text: "Bayesian Independent samples T-Test"
    //     }
    //     MenuItem {
    //         text: "Bayesian Paired samples T-Test"
    //     }
    //     MenuItem {
    //         text: "Bayesian One sample T-Test"
    //     }
    //
    //     function closeMenu() {
    //         contextMenu.close();
    //     }
    // }

    // ToolButton {
    //     id: tbutton
    //     text: qsTr("⋮")
    //
    //     anchors.left: backgroundImage.right
    //     anchors.top: parent.top
    //     anchors.bottom: parent.bottom
    //
    //     onClicked: contextMenu.popup()
    // }
}
