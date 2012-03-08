#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeEngine>
#include "qmlapplicationviewer.h"
#include "resourceimageprovider.h"
#include "trayicon.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setQuitOnLastWindowClosed(false);

    QmlApplicationViewer viewer;
    viewer.engine()->addImageProvider("qrc", new ResourceImageProvider());
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);

    TrayIcon tray(&viewer);
    tray.show();

    return app.exec();
}
