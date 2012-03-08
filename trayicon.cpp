#include "trayicon.h"
#include <QMenu>
#include <QIcon>
#include <QApplication>

TrayIcon::TrayIcon(QmlApplicationViewer * view, QObject *parent) :
    QSystemTrayIcon(parent)
{
    this->view = view;
    QMenu * menu = new QMenu();
    menu->addAction(tr("&Manage..."), this, SLOT(showManage()));
    menu->addAction(tr("&Exit"), this, SLOT(exitApp()));
    menu->addSeparator();
    menu->addAction(tr("About"), this, SLOT(showAbout()));
    menu->addAction(tr("About Qt"), this, SLOT(showAboutQt()));
    setContextMenu(menu);

    this->setIcon(QIcon(":/Gupaa.png"));
}

void TrayIcon::showManage() {
    view->setMainQmlFile("qml/taskManagement/TaskManWindow.qml");
    view->showExpanded();
}

void TrayIcon::exitApp() {
    exit(0);
}

void TrayIcon::showAbout() {
    view->setMainQmlFile("qml/about.qml");
    view->showExpanded();
}

void TrayIcon::showAboutQt() {
    QApplication::aboutQt();
}
