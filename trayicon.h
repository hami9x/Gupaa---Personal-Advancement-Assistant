#ifndef TRAYICON_H
#define TRAYICON_H

#include <QSystemTrayIcon>
#include <QDeclarativeView>
#include "qmlapplicationviewer.h"

class TrayIcon : public QSystemTrayIcon
{
    Q_OBJECT

    QmlApplicationViewer *view;
public:
    explicit TrayIcon(QmlApplicationViewer * view, QObject *parent = 0);

public slots:
    void showManage();
    void exitApp();
    void showAbout();
    void showAboutQt();
    void showTick();
    void showQml(QString file);
};

#endif // TRAYICON_H
