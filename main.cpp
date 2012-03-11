#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeEngine>
#include <QTranslator>
#include <QLocale>
#include "resourceimageprovider.h"
#include "trayicon.h"
#include "qmlview.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setQuitOnLastWindowClosed(false);


    QString locale = QLocale::system().name();

    QTranslator translator;
    translator.load("gupaa_vi");
    app.installTranslator(&translator);

    QmlView viewer;
    viewer.engine()->addImageProvider("qrc", new ResourceImageProvider());
    viewer.setOrientation(QmlView::ScreenOrientationAuto);
    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    TrayIcon tray(&viewer);
    tray.show();

    return app.exec();
}
