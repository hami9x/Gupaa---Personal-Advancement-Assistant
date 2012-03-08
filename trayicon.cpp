#include "trayicon.h"
#include <QMenu>
#include <QIcon>

TrayIcon::TrayIcon(QmlApplicationViewer * view, QObject *parent) :
    QSystemTrayIcon(parent)
{
    this->view = view;
    QMenu * menu = new QMenu();
    menu->addAction(tr("&Manage..."), this, SLOT(showManage()));
    menu->addAction(tr("&Exit"), this, SLOT(exitApp()));
    setContextMenu(menu);

    this->setIcon(QIcon(":/Gupaa.png"));
}

void TrayIcon::showManage() {
    view->close();
    view->setMainQmlFile("qml/taskManagement/TaskManWindow.qml");
    view->showExpanded();
}

void TrayIcon::exitApp() {
    exit(0);
}
