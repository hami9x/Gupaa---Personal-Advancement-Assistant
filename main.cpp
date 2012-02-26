#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeEngine>
#include "qmlapplicationviewer.h"
#include "ResourceImageProvider.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    viewer.engine()->addImageProvider("qrc", new ResourceImageProvider());
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
