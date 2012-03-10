#include "qmlview.h"
#include <QCloseEvent>

QmlView::QmlView(QWidget *parent) :
    QmlApplicationViewer(parent)
{
}

void QmlView::closeEvent ( QCloseEvent * event ) {
    emit closed();
    event->accept();
}
