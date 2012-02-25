#ifndef RESOURCEIMAGEPROVIDER_H
#define RESOURCEIMAGEPROVIDER_H

#include <QDeclarativeImageProvider>

class ResourceImageProvider: public QDeclarativeImageProvider
{
public:
    ResourceImageProvider()
        : QDeclarativeImageProvider(QDeclarativeImageProvider::Image)
    {
    }

    QImage requestImage(const QString & id, QSize * size, const QSize & requestedSize);
};

#endif // RESOURCEIMAGEPROVIDER_H
