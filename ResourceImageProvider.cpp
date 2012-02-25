#include "ResourceImageProvider.h"

QImage ResourceImageProvider::requestImage(const QString & id, QSize * size, const QSize & requestedSize)
{
    QString rsrcid = ":/" + id;
    QImage image(rsrcid);
    QImage result;

    if (requestedSize.isValid()) {
        result = image.scaled(requestedSize, Qt::KeepAspectRatio);
    } else {
        result = image;
    }
    *size = result.size();
    return result;
}
