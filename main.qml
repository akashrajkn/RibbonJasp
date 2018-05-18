import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Ribbon Jasp")

    Item {
        width: 500;
        height: 50;

        RibbonModel {
            id: summaryStatsRibbon
        }

        Component {
            id: ribbonButtonDelegate

            RibbonButton {
                text: _text
                source: _source
                menu: _menu
            }
        }

        Row {
            id: merengue

            Repeater {
                id: tabs
                model: summaryStatsRibbon
                delegate: ribbonButtonDelegate
            }

            ToolSeparator {
                height: 60;
            }
        }

        // Item {
        //     id: merengue
        //
        //     RibbonButton {
        //         anchors.left: parent.left
        //         id: ttestbutton
        //         text: "T-Tests"
        //         source: "qrc:/icons/analysis-bayesian-ttest.svg"
        //     }
        //
        //     RibbonButton {
        //         anchors.left: ttestbutton.right
        //         id: regressionbutton
        //         text: "Regression"
        //         source: "qrc:/icons/analysis-bayesian-crosstabs.svg"
        //     }
        //
        //     RibbonButton {
        //         anchors.left: regressionbutton.right
        //
        //         id: f_button
        //         text: "Frequencies"
        //         source: "qrc:/icons/analysis-bayesian-regression.svg"
        //     }
        //
        //     ToolSeparator {
        //         anchors.left: f_button.right
        //
        //         height: 60;
        //     }
        //
        // }

        MouseArea {
            // This ain't working
            onClicked: {
                ttestbutton.closeMenu();
                regressionbutton.closeMenu();
                f_button.closeMenu();
            }
        }

    }

}
