#ifndef TRAYICON_H
#define TRAYICON_H

#include <QSystemTrayIcon>
#include <QDeclarativeView>
#include "qmlview.h"

class TrayIcon : public QSystemTrayIcon
{
    Q_OBJECT

    QmlView *view;
public:
    explicit TrayIcon(QmlView * view, QObject *parent = 0);

public slots:
    void showManage();
    void exitApp();
    void showAbout();
    void showAboutQt();
    void showTick();
    void showScore();
    void showQml(QString file);
    void exitAndSeeYouAgain();
};

#endif // TRAYICON_H
