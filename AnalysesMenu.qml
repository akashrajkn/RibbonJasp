import QtQuick 2.0
import QtQuick.Controls 1.4 as QC1
import QtQuick.Controls 2.3 as QC2
import QtQuick.Controls.Styles 1.4

QC2.Popup {
    closePolicy: QC2.Popup.CloseOnPressOutside | QC2.Popup.CloseOnEscape

    property alias menu: repeater.model
    width: aitems.width + 25
    // width: {
    //     var max_width = t1.width
    //     if (t2.width > max_width) {
    //         max_width = t2.width
    //     }
    //
    //     if (t3.width > max_width) {
    //         max_width = t3.width
    //     }
    //
    //     return max_width + 25
    //
    //     // var result = 0;
    //     // var padding = 0;
    //     // for (var i = 0; i < popupitems.count; ++i) {
    //     //     var item = popupitems.itemAt(i);
    //     //     result = Math.max(item.contentItem.implicitWidth, result);
    //     //     padding = Math.max(item.padding, padding);
    //     // }
    //     // return result + padding * 2;
    // }
    height: aitems.implicitHeight + 25  //(t1.implicitHeight + t2.implicitHeight + t3.implicitHeight) + 25
    modal: true
    focus: false

    y: mice.mouseY
    x: mice.mouseX

    Column {
        id: aitems

        Repeater {
            id: repeater
            QC1.Button {
                text: modelData
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
                onClicked: {
                    console.log(modelData)
                    button.clicked()
                    popup.close()
                }
            }
        }
    }


    // Item {
    //     id: popupitems
    //     Button {
    //         id: t1
    //         text: "Bayesian Independent samples T-Test"
    //         onClicked: {
    //             console.log("JASP -- clicked")
    //             button.clicked()
    //             popup.close()
    //         }
    //     }
    //
    //     Button {
    //         id: t2
    //         anchors.top: t1.bottom
    //         text: "Bayesian Paired samples T-Test"
    //         onClicked: {
    //             button.clicked()
    //             popup.close()
    //         }
    //     }
    //
    //     Button {
    //         id: t3
    //         anchors.top: t2.bottom
    //         text: "Bayesian One sample T-Test"
    //         onClicked: {
    //             button.clicked()
    //             popup.close()
    //         }
    //     }
    // }

}
