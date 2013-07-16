#include <QApplication>
#include "qmlwindow.h"
#include "callmodel.h"

int main(int argc, char *argv[])
{
    CallModel::instance();
    //QGuiApplication app(argc, argv);

    //QtQuick2ApplicationViewer viewer;
    //viewer.setMainQmlFile(QStringLiteral("qml/testqml10/main.qml"));
    //viewer.showExpanded();
    QApplication a(argc, argv);
    QmlWindow w;
    w.show();

    return a.exec();
}
