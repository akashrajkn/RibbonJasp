import QtQuick 2.0

ListModel {
    ListElement {
        _text: "T-Tests"
        _source: "qrc:/icons/analysis-bayesian-ttest.svg"
        _menu: [
            ListElement { name: "Bayesian Independent samples T-Test" },
            ListElement { name: "Bayesian Paired samples T-Test" },
            ListElement { name: "Bayesian One sample T-Test" }
        ]
    }
    ListElement {
        _text: "Regression"
        _source: "qrc:/icons/analysis-bayesian-crosstabs.svg"
        _menu: [
            ListElement { name: "Bayesian Correlation Pairs" },
            ListElement { name: "Bayesian Linear Regression" }
        ]
    }
    ListElement {
        _text: "Frequencies"
        _source: "qrc:/icons/analysis-bayesian-regression.svg"
        _menu: [
            ListElement { name: "Bayesian Binomial Test" }
        ]
    }
}
