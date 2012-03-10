#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeEngine>
#include "resourceimageprovider.h"
#include "trayicon.h"
#include "qmlview.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setQuitOnLastWindowClosed(false);

    QmlView viewer;
    viewer.engine()->addImageProvider("qrc", new ResourceImageProvider());
    viewer.setOrientation(QmlView::ScreenOrientationAuto);
    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    TrayIcon tray(&viewer);
    tray.show();

    return app.exec();
}
