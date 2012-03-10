#include "trayicon.h"
#include <QMenu>
#include <QIcon>
#include <QApplication>
#include <QMessageBox>

TrayIcon::TrayIcon(QmlView * view, QObject *parent) :
    QSystemTrayIcon(parent)
{
    this->view = view;
    QMenu * menu = new QMenu();
    menu->addAction((tr("&End of day")), this, SLOT(showScore()));
    menu->addSeparator();
    menu->addAction(tr("&Tick"), this, SLOT(showTick()));
    menu->addAction(tr("&Manage..."), this, SLOT(showManage()));
    menu->addSeparator();
    menu->addAction(tr("&About"), this, SLOT(showAbout()));
    menu->addAction(tr("About &Qt"), this, SLOT(showAboutQt()));
    menu->addAction(tr("Exit"), this, SLOT(exitApp()));
    setContextMenu(menu);

    this->setIcon(QIcon(":/Gupaa.png"));
}

void TrayIcon::showQml(const QString file) {
    view->setMainQmlFile(file);
    view->showExpanded();
    view->activateWindow();
    view->raise();
}

void TrayIcon::showManage() {
    showQml("qml/taskManagement/TaskManWindow.qml");
}

void TrayIcon::showTick() {
    showQml("qml/taskManagement/TickWindow.qml");
}

void TrayIcon::exitApp() {
    exit(0);
}

void TrayIcon::showAbout() {
    showQml("qml/about.qml");
}

void TrayIcon::showAboutQt() {
    QApplication::aboutQt();
}

void TrayIcon::showScore() {
    showQml("qml/ScoreWindow.qml");
    connect(view, SIGNAL(closed()), this, SLOT(exitAndSeeYouAgain()));
}

void TrayIcon::exitAndSeeYouAgain() {
    QMessageBox::information(view, tr("Good bye"), tr("Day ended, huh? See you again tomorrow :D"));
    exitApp();
}
