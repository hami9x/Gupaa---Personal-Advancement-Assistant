#ifndef QMLVIEW_H
#define QMLVIEW_H

#include "qmlapplicationviewer.h"

class QmlView : public QmlApplicationViewer
{
    Q_OBJECT
public:
    explicit QmlView(QWidget *parent = 0);
    virtual void closeEvent(QCloseEvent * event);
    
signals:
    void closed();
};

#endif // QMLVIEW_H
