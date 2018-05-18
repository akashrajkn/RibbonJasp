import QtQuick 2.0
import QtQuick.Controls 2.3


Rectangle {
    id: button
    width: (innerText.width > backgroundImage.width ? innerText.width : backgroundImage.width) + 20 // + 2*tbutton.width
    height: 60 // backgroundImage.height + innerText.height
    property alias text: innerText.text
    property alias source: backgroundImage.source
    property alias menu: popup.menu
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

    AnalysesMenu {
        id: popup
       // menu: ["Bayesian Independent samples T-Test", "Bayesian Paired samples T-Test", "Bayesian One sample T-Test"]
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
